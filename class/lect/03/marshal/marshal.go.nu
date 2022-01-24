  1: package main
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6: )
  7: 
  8: type Demo struct {
  9:     Aa int
 10:     Ab string
 11: }
 12: 
 13: func main() {
 14:     d := Demo{
 15:         Aa: 33,
 16:         Ab: "Penguines are People Too...",
 17:     }
 18: 
 19:     buf, err := json.Marshal(d)
 20:     if err != nil {
 21:         fmt.Printf("Error: %s\n", err)
 22:     }
 23: 
 24:     fmt.Printf("%s\n", buf)
 25: 
 26:     buf, err = json.MarshalIndent(d, "", "\t")
 27:     if err != nil {
 28:         fmt.Printf("Error: %s\n", err)
 29:     }
 30: 
 31:     fmt.Printf("%s\n", buf)
 32: }
