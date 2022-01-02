  1: package main
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6: )
  7: 
  8: var IVar int
  9: var SVar string
 10: var I64Var int64
 11: var UIVar uint64
 12: 
 13: type Example17 struct {
 14:     A int
 15:     B string
 16: }
 17: 
 18: var E17 Example17
 19: 
 20: // Add int64 and uint64 types
 21: var SliceOfString []string
 22: var MapOfString map[string]string
 23: var MapOfBool map[string]bool
 24: 
 25: // init will initilize data before main() runs.  You can have more than one init() function.
 26: func init() {
 27:     SliceOfString = make([]string, 0, 10)
 28:     MapOfString = make(map[string]string)
 29:     MapOfBool = make(map[string]bool)
 30: }
 31: 
 32: func main() {
 33:     SliceOfString = append(SliceOfString, "AAA", "BBB")
 34:     MapOfString["mark"] = "first"
 35:     MapOfString["twain"] = "last"
 36:     MapOfBool["mark"] = true
 37:     MapOfBool["twain"] = false
 38: 
 39:     fmt.Printf("IVar = %d, type of IVar %T\n", IVar, IVar)
 40:     fmt.Printf("IVar = %v, type of IVar %T\n", IVar, IVar)
 41:     // TODO: add prints for your int64 and uint64 types
 42:     fmt.Printf("SVar = %s, type of SVar %T\n", SVar, SVar)
 43:     fmt.Printf("Address of SVar = %s, type of SVar %T\n", &SVar, &SVar)
 44:     fmt.Printf("E17 = %s, type of E17 %T\n", &E17, &E17)
 45:     fmt.Printf("    E17 = %+v, E17 as JSON: %s\n", &E17, IndentJSON(E17))
 46:     // TODO: add prints for the other types above - so you can see them printed out.
 47:     // TODO: use a %s and a %T for SliceOfString
 48:     // TODO: use a %s and a %T for MapOfString
 49:     // TODO: use a %#v and a %T for MapOfBool
 50:     // TODO: Print out each of them with the IndentJSON function.
 51: }
 52: 
 53: func IndentJSON(v interface{}) string {
 54:     s, err := json.MarshalIndent(v, "", "\t")
 55:     if err != nil {
 56:         return fmt.Sprintf("Error:%s", err)
 57:     } else {
 58:         return string(s)
 59:     }
 60: }
