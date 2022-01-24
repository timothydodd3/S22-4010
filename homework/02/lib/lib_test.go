package lib

import (
	"testing"
)

type BlockType struct {
	N int
	S string
}

func TestSVar(t *testing.T) {

	tests := []struct {
		bk       BlockType
		expected string
	}{
		{
			bk: BlockType{
				N: 1,
				S: "abc",
			},
			expected: `{"N":1,"S":"abc"}`,
		},
	}

	for ii, test := range tests {
		bk := &test.bk
		s := SVar(bk)
		if s != test.expected {
			t.Errorf("Test %d, expected %s got %s\n", ii, test.expected, s)
		}
	}
}

func TestExists(t *testing.T) {
	if Exists("./xxxxx") {
		t.Errorf("Expected to be not-found - it was true instead.")
	}
	if !Exists("./lib.go") {
		t.Errorf("Expected to be found - it was false instead.")
	}
}
