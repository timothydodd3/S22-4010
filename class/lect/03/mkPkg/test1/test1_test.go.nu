  1: package test1
  2: 
  3: import "testing"
  4: 
  5: // Your Name
  6: 
  7: func TestDouble(t *testing.T) {
  8: 
  9:     tests := []struct {
 10:         in       int
 11:         expected int
 12:     }{
 13:         {
 14:             in:       23,
 15:             expected: 46,
 16:         },
 17:         {
 18:             in:       1,
 19:             expected: 2,
 20:         },
 21:     }
 22: 
 23:     for ii, test := range tests {
 24:         rr := DoubleValue(test.in)
 25:         if rr != test.expected {
 26:             t.Errorf("Test %d, expected %d got %d\n", ii, test.expected, rr)
 27:         }
 28:     }
 29: 
 30: }
 31: 
 32: // add test for TripleValue at this point
