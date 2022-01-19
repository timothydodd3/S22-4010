  1: package main
  2: 
  3: // Your Name - it is important if you want to get credit for your assignment.
  4: // Assignment 1.3 echo command line arguments.
  5: 
  6: import (
  7:     "fmt"
  8:     "os"
  9: )
 10: 
 11: func main() {
 12:     ags := os.Args[1:]
 13:     //  ^-------------------------- Declare
 14:     //     ^----------------------- use "os" package
 15:     //        ^-------------------- Command line arguments
 16:     //            ^---------------- Arguments are an array
 17:     //             ^--- 1: -------- this is a sub-slice of array
 18:     for ii, ag := range ags {
 19:         if ii < len(ags)-1 {
 20:             fmt.Printf("%s ", ag)
 21:         } else {
 22:             fmt.Printf("%s", ag)
 23:         }
 24:     }
 25:     fmt.Printf("\n")
 26: }
