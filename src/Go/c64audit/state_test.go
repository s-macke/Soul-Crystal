package main

import (
	"bytes"
	"encoding/binary"
	"encoding/json"
	"testing"
)

func TestInitialStateAgainstNativeInitializer(t *testing.T) {
	state, payload, blocks := loadInitialState("../../..")
	snapshot := mustRead("../../../data/C64/snapshots/diskb1.vsf")[0x99:0x10099]
	memory := append([]byte(nil), snapshot...)
	// Unsaved sentinel slots have an explicit zero policy. Do not inherit played values.
	for _, a := range stateArrays {
		for i := 0; i < a.count*a.width; i++ {
			memory[a.address+i] = 0
		}
	}
	_, native := nativeStateRoutine(t, memory, true, blocks, 0x569d)
	for _, a := range stateArrays {
		for i, want := range state.Arrays[a.name] {
			actual := uint16(native[a.address+i*a.width])
			if a.width == 2 {
				actual = binary.LittleEndian.Uint16(native[a.address+i*a.width:])
			}
			if actual != want {
				t.Fatalf("%s[%d]: original initializer=%d exported=%d", a.name, i, actual, want)
			}
		}
	}
	for name, addr := range map[string]int{"score": 0x698c, "steps": 0x698e} {
		if binary.LittleEndian.Uint16(native[addr:]) != state.Scalars[name] {
			t.Fatal(name)
		}
	}
	for name, addr := range map[string]int{"currentRoom": 0x695d, "gamePart": 0x6963, "engineState69BF": 0x69bf} {
		if uint16(native[addr]) != state.Scalars[name] {
			t.Fatal(name)
		}
	}
	if state.Scalars["currentRoom"] != 3 || state.Scalars["steps"] != 1 || state.Scalars["score"] != 0 || state.Scalars["gamePart"] != 1 {
		t.Fatal("unexpected original new-game state")
	}
	if !bytes.Equal(payload, mustRead("../../../data/C64/state/initial_payload.bin")) {
		t.Fatal("stored disk payload changed")
	}
	want, e := json.MarshalIndent(state, "", "  ")
	if e != nil {
		t.Fatal(e)
	}
	if !bytes.Equal(append(want, '\n'), mustRead("../../../data/C64/state/new_game.json")) {
		t.Fatal("JSON differs from original disk initialization")
	}
	if !bytes.Equal(stateC(state), mustRead("../../../out/game_state.c")) {
		t.Fatal("C state definitions stale")
	}
}
