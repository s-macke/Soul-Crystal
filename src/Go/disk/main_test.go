package main

import (
	"bytes"
	"testing"
)

func TestExtractChainFinalSector255Includes254PayloadBytes(t *testing.T) {
	buf := make([]byte, d64Size)
	offset, err := d64Pos(1, 0, 0)
	if err != nil {
		t.Fatalf("d64Pos: %v", err)
	}

	block := buf[offset : offset+sectorSize]
	block[0] = 0x00
	block[1] = 0xFF
	for i := 2; i < sectorSize; i++ {
		block[i] = byte(i)
	}

	payload, err := extractChain(buf, sectorRef{track: 1, sector: 0})
	if err != nil {
		t.Fatalf("extractChain: %v", err)
	}

	if len(payload) != 254 {
		t.Fatalf("payload length = %d, want 254", len(payload))
	}
	if !bytes.Equal(payload, block[2:]) {
		t.Fatalf("payload mismatch for final 0/255 block")
	}
}

func TestExtractChainAllowsSectorZeroInNextLink(t *testing.T) {
	buf := make([]byte, d64Size)

	firstOffset, err := d64Pos(1, 1, 0)
	if err != nil {
		t.Fatalf("d64Pos first: %v", err)
	}
	first := buf[firstOffset : firstOffset+sectorSize]
	first[0] = 0x01
	first[1] = 0x00
	for i := 2; i < sectorSize; i++ {
		first[i] = 0xA0
	}

	secondOffset, err := d64Pos(1, 0, 0)
	if err != nil {
		t.Fatalf("d64Pos second: %v", err)
	}
	second := buf[secondOffset : secondOffset+sectorSize]
	second[0] = 0x00
	second[1] = 0x02

	payload, err := extractChain(buf, sectorRef{track: 1, sector: 1})
	if err != nil {
		t.Fatalf("extractChain: %v", err)
	}

	if len(payload) != 255 {
		t.Fatalf("payload length = %d, want 255", len(payload))
	}
	if !bytes.Equal(payload[:254], first[2:]) {
		t.Fatalf("first sector payload mismatch")
	}
	if !bytes.Equal(payload[254:], second[2:3]) {
		t.Fatalf("final sector payload mismatch")
	}
}
