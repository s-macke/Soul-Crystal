# Memory Map

This file summarizes the current confirmed understanding of the C64 memory image.

The old version mixed useful observations with broad compiler/runtime guesses. This update prefers narrower statements backed by the current disassembly and Opcode Oracle annotations.

## Main Regions

| Range | Current understanding | Notes |
| --- | --- | --- |
| `$0000-$0078` | Zero-page workspace | Shared scratch, pointers, and ROM-facing workspace. |
| `$0079` | Tiny helper subroutine | `SUB_0079`. |
| `$007A-$0C2D` | Mostly data / runtime support | Not yet mapped in detail. |
| `$0C2E-$1B9F` | Inline-descriptor helpers, resource loaders, range-descriptor parsing, and support runtime code | Includes the generic call trampoline, descriptor parsers, range-segment lookup, and string/field extraction helpers. |
| `$1C12-$3A1F` | Adventure-script VM interpreter | Main VM dispatcher and opcode handlers. Uses `$6976/$6977` as script PC. |
| `$3A00-$62FF` | High-level game logic, text/image dispatch, room/resource flows, and SPECIAL handlers | Includes text display, image display, room resource loading, disk-side selection flow, and manual-check flow. |
| `$55CF-$5602` | Disk-side / disk-ID mapping strings | Parsed by the type-`$06` range-segment parser. |
| `$567E-$5698` | Disk ID string list | Contains `"DA"`, `"DB"`, `"DC"`, `"DD"`, `"PB"`, `"DS"`. |
| `$6199-$62B8` | Manual-check / copy-protection question table | Encodes the question fields used to ask for character, word, page, row, paragraph, and expected character. |
| `$62FC-$67FF` | Resource/image pipeline code | Stream-position helpers, room image unpacker, and image postprocess path. |
| `$6800-$75FF` | Data and working tables | Includes room/resource-related data and selector tables; not fully mapped. |
| `$7600-$95FF` | Resident adventure-script bytecode and nearby tables | `$7600` is the default VM entry point. `$9500` is used as a local selector/table base in the disk-side flow. |
| `$9609-$992C` | Frontend/UI/input service block | Output buffer management, staged frontend refresh, prompt helpers, and input polling. |
| `$99B1-$99D0` | Memory banking helpers | Push/pop memory configuration. |
| `$99D1-$A76F` | Runtime / engine support code | Still mixed, but clearly executable support logic rather than plain data. |
| `$A77A-$A92A` | High-level music/resource management | Prepares music/display resources and resource sequences. |
| `$A92B-$AA2B` | Music resource sequence loader and support data | Walks resource descriptors and related tables. |
| `$AA2C-$B00A` | Data and support code | Not fully mapped. |
| `$B00B-$B910` | SID player core | Player entry, frame tick, fade handling, and register flush to `$D400+`. |
| `$B926-$BC1A` | SID song data | Song header, phrase pointers, and instrument/control data. |
| `$BC1B-$C8FF` | Mixed support code and data | Includes helper routines but not fully classified. |
| `$C900-$CFFF` | Indexed disk/resource access, serial transport, Huffman text decode, and image RLE decode | This is the main disk/resource service layer. |
| `$D000-$DFFF` | I/O area | SID/VIC/CIA visible here; color RAM fixed at `$D800-$DBE7`. |
| `$E000-$F7FF` | Late data / vectors / less-mapped support area | Still mostly unclassified. |
| `$F800-$FBFF` | Display buffer / staging region | Used during display and image setup. |
| `$FC00-$FFE7` | Active screen RAM | Current screen matrix in the selected VIC bank. |
| `$FFF8-$FFFF` | Vectors / top-of-memory control data | Includes vector area. |

## Key Code Blocks

### `$0CDB-$12F9`: Generic service-call trampoline

Important entries:

- `$0CDB` `call_vector_helper`
- `$12AA` `load_inline_vector_or_literal`
- `$12D4` `call_loaded_vector_preserving_state`
- `$12F9` `jmp_indirect_004e`

This is the generic indirect call mechanism used for frontend services and disk/resource services.

### `$0D37-$0D4F`: Resource descriptor loaders

- `$0D37` `resource_copy_descriptor_dispatch`
- `$0D4F` `resource_load_descriptor_dispatch`
- `$13B0` `resource_decode_inline_descriptor`
- `$1416` `resource_register_window_metadata`
- `$1474` `resource_find_saved_descriptor_frame`

`$0D4F` is the main high-level resource loader and is called by `JSR` followed by a fixed 7-byte inline descriptor.

### `$0E11-$16A5`: Range-descriptor and segment parser

- `$0E11` `init_range_descriptor_for_offset`
- `$0E7D` `extract_from_range_segment`
- `$15B1` `decode_range_extract_param`
- `$15EC` `parse_type6_segment_field`
- `$1B82` `default_range_descriptor_table`

The default range-descriptor table at `$1B82` currently contains these confirmed segment starts:

- `$4437`
- `$55CF` `disk_side_id_mapping_list`
- `$567E` `disk_id_string_list`
- `$5CBF`
- `$6199` `manual_check_question_table`

### `$1C12-$3059`: Adventure-script VM core

Important entries:

- `$1C12` `script_vm_dispatch`
- `$1D71` `script_vm_read_next_token`
- `$1E8C` `script_vm_read_value`
- `$2908` `script_vm_push_return`
- `$2950` `script_vm_pop_return`
- `$2D38` script indirect-call opcode
- `$2FAB` SPECIAL dispatch area

The VM uses:

- `$6976/$6977` as script PC
- `$7600` as the default resident script entry point

### `$3C02-$409F`: Text and image dispatch

- `$3C02` `script_vm_show_text`
- `$4022` text/resource dispatch helper
- `$4087` `script_vm_show_image`
- `$409F` lightweight frontend/runtime follow-up helper

The text path reaches the indexed-record decoder through:

```asm
JSR $0CDB
.BYTE $00,$00,$CB
```

which resolves to `$CB00` `svc_decode_indexed_record`.

### `$4B4D-$4C65`: Room/resource loaders

- `$4B4D` `room_resource_load_current`
- `$4B60` `room_resource_load_secondary`

These are room-facing wrappers layered above the generic resource and frontend service calls.

### `$52D2-$569D`: Disk-change and disk-side selection flow

Confirmed pieces:

- `$52D2` `special_09_disk_install_flow`
- `$53A4` `disk_side_selection_loop`
- `$54EB` `reload_disk_side_tables`
- `$56FD` `load_disk_side_metadata_block`
- `$569D` `enter_disk_side_selection_flow`

This path:

1. prompts for a disk change,
2. loads selector-side metadata,
3. reads the currently inserted disk header,
4. compares it against the selected disk ID,
5. bulk-reloads side-specific resource metadata when needed.

### `$60DC-$6198`: Manual-check / copy-protection prompt builder

- `$60DC` `manual_check_build_prompt`
- `$614A` six-field extraction loop
- `$618D` final prompt emission

Uses `manual_check_question_table` at `$6199`.

### `$651C-$6775`: Room image handling

- `$6501` `image_pipeline_preamble`
- `$651C` `room_image_unpack_entry`
- `$6775` `room_image_postprocess_entry`

This is the second-stage room-image pipeline, after the raw indexed-record decode.

## Script-Visible State

These are the main VM variables currently identified:

| Address | Name |
| --- | --- |
| `$6986/$6987` | `command` |
| `$6988/$6989` | `object1` |
| `$698A/$698B` | `object2` |
| `$698C/$698D` | `pointsum` |
| `$698E/$698F` | `steps` |
| `$6990/$6991` | `textoutput` |
| `$6992/$6993` | `temp` |
| `$6994/$6995` | `imageno` |
| `$6996/$6997` | `var_6996` |
| `$6998/$6999` | `var_6998` |
| `$699A/$699B` | `var_699A` |

Other important state:

- `$6961` `frontend_input_code`
- `$9624` `frontend_io_mode`
- `$9631` `frontend_raw_input_code`

## World / Table Data

Confirmed script-visible tables:

| Address | Meaning |
| --- | --- |
| `$69C6` | `object_description_table` |
| `$6B12` | `points_table` |
| `$6C5E` | `object_position_table` |
| `$6D04` | `object_status_table` |
| `$6DAA` | `north_exit_table` |
| `$6E12` | `south_exit_table` |
| `$6E7A` | `west_exit_table` |
| `$6EE2` | `east_exit_table` |
| `$6F4A` | `up_exit_table` |
| `$6FB2` | `down_exit_table` |
| `$7027` | `visited_room_table` |

The block around `$6D18-$6D9F` is now treated as current-room environment / classification flags:

- `$6D18` `room_env_flag_group_a`
- `$6D51` `room_env_flag_group_b`
- `$6D81` `room_env_flag_group_c`
- `$6D82` `room_env_flag_group_d`
- `$6D93` `room_env_flag_group_e`
- `$6D97` `room_env_flag_group_f`
- `$6D98` `room_env_flag_group_g`
- `$6D9B` `room_env_flag_group_h`

## Frontend / Input Block

Main confirmed entries:

- `$9609` `output_cycle_begin`
- `$960C` `output_buffer_append_char`
- `$9615` `svc_runtime_swap_tables`
- `$9618` `svc_runtime_swap_tables_and_apply`
- `$961B` `svc_frontend_refresh_cycle`
- `$9625` `svc_clear_output_buffer`
- `$9628` `svc_frontend_stage_open`
- `$962B` `svc_frontend_stage_close`
- `$9684` `output_cycle_flush_to_screen`
- `$977D` `frontend_refresh_cycle_body`
- `$9803` `frontend_poll_input_loop`
- `$9966` `frontend_input_enabled`
- `$99B1` `runtime_push_mem_config`
- `$99D0` `runtime_pop_mem_config`

Input codes currently mapped with good confidence:

- `$03` = ESC in the modal disk-side prompt flow
- `$0C` = left mouse
- `$12` = right mouse
- `$5F` = SPACE in prompt flows

## Music / SID

### High-level music/resource management

- `$A77A` `music_build_display_resources`
- `$A92B` `music_load_resource_sequence`

### SID player core

- `$B00B` `sid_swap_player_zero_page_context`
- `$B029` `sid_wait_for_fade_completion`
- `$B041` `sid_player_output_tail`
- `$B04A` `sid_player_write_filter_volume`
- `$B32E` `sid_player_tick_entry`
- `$B33D` `sid_player_run_frame`
- `$B910` `sid_player_flush_registers`

### SID music data

- `$B926/$B927` `sid_song_header_ptr`
- `$B928/$B929` instrument table base
- `$B92A/$B92B` phrase pointer table
- `$B9FA` `sid_song_header_00`

The embedded SID song data occupies roughly `$B926-$BC1A`.

## Disk / Resource Service Layer

### Top-level service entries

| Address | Meaning |
| --- | --- |
| `$C903` | `svc_prepare_stream_tables` |
| `$CB00` | `svc_decode_indexed_record` |
| `$CB03` | `svc_read_protocol_block` |
| `$CB09` | `svc_write_block` |
| `$CB0C` | `svc_read_record_header` |
| `$CB18` | `svc_bulk_load_tables` |
| `$CB21` | `svc_load_table_by_index` |

### Serial / protocol layer

| Address | Meaning |
| --- | --- |
| `$CB24` | `serial_set_buffer_ptr` |
| `$CB55` | `serial_send_command_header` |
| `$CB8C` | `serial_restore_dd00` |
| `$CB8F` | `serial_wait_ready_edge` |
| `$CBB7` | `serial_send_encoded_byte` |
| `$CBD3` | `serial_read_record_header_body` |
| `$CBF9` | `serial_expect_zero_byte` |
| `$CC08` | `serial_write_block_body` |
| `$CC53` | `serial_read_block_84_bytes` |
| `$CC90` | `serial_read_block_body` |
| `$CCD7` | `serial_read_sync_word` |
| `$CCE7` | `serial_read_encoded_byte` |
| `$CD11` | `serial_write_encoded_byte` |

### Indexed resource metadata and decoders

| Address | Meaning |
| --- | --- |
| `$CD30` | `bulk_load_protocol_tables` |
| `$CD7A` | `decode_stream_table_record` |
| `$CDDD` | `decode_stream_entry` |
| `$CE0F` | `decode_rle_image_stream` |
| `$CEF2` | `decode_huffman_text_stream` |
| `$CF4F` | `read_decode_table_byte` |

### In-memory loaded metadata

| Address | Meaning |
| --- | --- |
| `$CA00-$CA7F` | `huffman_tree_bit1_table` |
| `$CA80-$CAFF` | `huffman_tree_bit0_table` |
| `$CB1D/$CB1E` | indexed-record triplet table base |
| `$C900+` | loaded indexed-record metadata bundle |

Confirmed transfer-buffer destinations used by the bulk table loader:

- `$0400`
- `$0500`
- `$0600`
- `$0700`
- `$0800`
- `$0900`
- `$C900`
- `$CA00`

`$9500` is also confirmed as a local table base used by the disk-side selection flow, but not as a `serial_set_buffer_ptr` destination.

Additional observed protocol-returned destinations:

- During disk change, the special `A = 0` path in `$CC08` `serial_write_block_body` has been observed installing `$AD/$AE = $7600`.
- The same path has also been observed installing `$AD/$AE = $B926`.

Those destinations do not come from `serial_set_buffer_ptr ($CB24)`; they are supplied by the protocol response handled inside `$CC08`.

Best current interpretation:

- `$7600` matches the resident VM bytecode region.
- `$B926` matches the SID song/resource header block and is therefore a strong match for music-resource refresh during disk change.

## Display / I/O Areas

| Address | Meaning |
| --- | --- |
| `$D800-$DBE7` | Color RAM |
| `$F800-$FBFF` | Display buffer / staging area |
| `$FC00-$FFE7` | Active screen RAM |

## Known Limits

- Large parts of `$007A-$0C2D`, `$6800-$75FF`, `$99D1-$A76F`, `$AA2C-$B00A`, and `$E000-$F7FF` still need better classification.
- `$7600` is confirmed as the resident VM entry point, but there is still no confirmed disk-switch path that reloads VM bytecode into it.
- `$7600` and `$B926` are now confirmed as protocol-returned write destinations during disk change. `$B926` is a strong match for SID music loading; `$7600` still needs tighter semantic confirmation.
- The lower-level mapping from protocol selectors to raw D64 absolute offsets appears to live outside this main binary.
