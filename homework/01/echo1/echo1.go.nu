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
 13:     for ii, ag := range ags {
 14:         if ii < len(ags)-1 {
 15:             fmt.Printf("%s ", ag)
 16:         } else {
 17:             fmt.Printf("%s", ag)
 18:         }
 19:     }
 20:     fmt.Printf("\n")
 21: }
