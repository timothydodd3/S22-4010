  1: package lib
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6:     "os"
  7: )
  8: 
  9: // SVar  marshals and indents a data structure into JSON.
 10: func SVar(v interface{}) string {
 11:     // s, err := json.Marshal ( v )
 12:     s, err := json.Marshal(v)
 13:     if err != nil {
 14:         return fmt.Sprintf("Error:%s", err)
 15:     }
 16:     return string(s)
 17: }
 18: 
 19: // SVarI  marshals and indents a data structure into JSON.
 20: func SVarI(v interface{}) string {
 21:     // s, err := json.Marshal ( v )
 22:     s, err := json.MarshalIndent(v, "", "\t")
 23:     if err != nil {
 24:         return fmt.Sprintf("Error:%s", err)
 25:     }
 26:     return string(s)
 27: }
 28: 
 29: // Exists returns true if a file or directory exists.
 30: func Exists(name string) bool {
 31:     if _, err := os.Stat(name); err != nil {
 32:         if os.IsNotExist(err) {
 33:             return false
 34:         }
 35:     }
 36:     return true
 37: }
