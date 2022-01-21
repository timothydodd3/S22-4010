  1: package main
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6: )
  7: 
  8: type Demo struct {
  9:     Aa int `json:"A_cx"`
 10:     Ab string
 11: }
 12: 
 13: func main() {
 14:     s := `{
 15:         "A_cx": 33,
 16:         "Ab": "Penguines are People Too...",
 17:         "Ac": "skips this, no error"
 18:     }`
 19: 
 20:     var d Demo
 21:     err := json.Unmarshal([]byte(s), &d)
 22:     if err != nil {
 23:         fmt.Printf("Error: %s\n", err)
 24:     }
 25: 
 26:     fmt.Printf("%+v\n", d)
 27: }
