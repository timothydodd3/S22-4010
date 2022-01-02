  1: package main
  2: 
  3: // Your Name
  4: 
  5: import (
  6:     "fmt"
  7: 
  8:     "github.com/pschlump/myPkg/test1" // import package you created
  9: )
 10: 
 11: func main() {
 12:     out := test1.DoubleValue(8)   // Call function in your package
 13:     fmt.Printf("out = %d\n", out) // should print "out = 16"
 14:     // add call to TripleValue at this point
 15: }
