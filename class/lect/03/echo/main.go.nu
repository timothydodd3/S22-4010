  1: package main
  2: 
  3: import (
  4:     "fmt"
  5:     "os"
  6: )
  7: 
  8: func main() {
  9:     for i, s := range os.Args {
 10:         if i == 0 {
 11:         } else if i == len(os.Args)-1 {
 12:             fmt.Printf("%s\n", s)
 13:         } else {
 14:             fmt.Printf("%s ", s)
 15:         }
 16:     }
 17: }
