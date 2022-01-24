  1: package lib
  2: 
  3: import (
  4:     "testing"
  5: )
  6: 
  7: type BlockType struct {
  8:     N int
  9:     S string
 10: }
 11: 
 12: func TestSVar(t *testing.T) {
 13: 
 14:     tests := []struct {
 15:         bk       BlockType
 16:         expected string
 17:     }{
 18:         {
 19:             bk: BlockType{
 20:                 N: 1,
 21:                 S: "abc",
 22:             },
 23:             expected: `{"N":1,"S":"abc"}`,
 24:         },
 25:     }
 26: 
 27:     for ii, test := range tests {
 28:         bk := &test.bk
 29:         s := SVar(bk)
 30:         if s != test.expected {
 31:             t.Errorf("Test %d, expected %s got %s\n", ii, test.expected, s)
 32:         }
 33:     }
 34: }
 35: 
 36: func TestExists(t *testing.T) {
 37:     if Exists("./xxxxx") {
 38:         t.Errorf("Expected to be not-found - it was true instead.")
 39:     }
 40:     if !Exists("./lib.go") {
 41:         t.Errorf("Expected to be found - it was false instead.")
 42:     }
 43: }
