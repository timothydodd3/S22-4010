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
 41:     // add prints for your int64 and uint64 types
 42:     fmt.Printf("SVar = %s, type of SVar %T\n", SVar, SVar)
 43:     fmt.Printf("Address of SVar = %s, type of SVar %T\n", &SVar, &SVar)
 44:     fmt.Printf("E17 = %s, type of E17 %T\n", &E17, &E17)
 45:     fmt.Printf("    E17 = %+v, E17 as JSON: %s\n", &E17, IndentJSON(E17))
 46:     // add prints for the other types above - so you can see them printed out.
 47:     // use a %s and a %T for SliceOfString
 48:     // use a %s and a %T for MapOfString
 49:     // use a %#v and a %T for MapOfBool
 50:     // Print out each of them with the IndentJSON function.
 51:     fmt.Printf("SliceOfString = %s, type of SliceOfString %T\n", SliceOfString, SliceOfString) // xyzzy - answer
 52:     fmt.Printf("MapOfString = %s, type of MapOfString %T\n", MapOfString, MapOfString)         // xyzzy - answer
 53:     fmt.Printf("MapOfBool = %#v, type of MapOfBool %T\n", MapOfBool, MapOfBool)                // xyzzy - answer
 54:     fmt.Printf("    SliceOfString: %s\n", IndentJSON(SliceOfString))                           // xyzzy - answer
 55:     fmt.Printf("    MapOfString: %s\n", IndentJSON(MapOfString))                               // xyzzy - answer
 56:     fmt.Printf("    MapOfBool: %s\n", IndentJSON(MapOfBool))                                   // xyzzy - answer
 57: }
 58: 
 59: func IndentJSON(v interface{}) string {
 60:     s, err := json.MarshalIndent(v, "", "\t")
 61:     if err != nil {
 62:         return fmt.Sprintf("Error:%s", err)
 63:     } else {
 64:         return string(s)
 65:     }
 66: }
