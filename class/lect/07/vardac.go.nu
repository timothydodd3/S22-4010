  1: package main
  2: 
  3: import "fmt"
  4: 
  5: func vexample(a int, b ...interface{}) {
  6:     for pos, bVal := range b {
  7:         switch v := bVal.(type) {
  8:         case int:
  9:             fmt.Printf("It's an int, %d at %d\n", v, pos)
 10:         case []int:
 11:             fmt.Printf("It's a slice of int\n")
 12:         default:
 13:             fmt.Printf("It's a something else\n")
 14:         }
 15:     }
 16: }
