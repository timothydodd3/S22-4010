  1: package main
  2: 
  3: // Your Name - it is important if you want to get credit for your assignment.
  4: // Assignment 1.4 echo command line arguments and parse arguments.
  5: 
  6: import (
  7:     "encoding/json"
  8:     "flag"
  9:     "fmt"
 10:     "io/ioutil"
 11:     "os"
 12: )
 13: 
 14: type ConfigData struct {
 15:     Name  string
 16:     Value string
 17: }
 18: 
 19: func main() {
 20:     var Cfg = flag.String("cfg", "cfg.json",
 21:         "config file for this call")
 22: 
 23:     // Parse CLI arguments to this, --cfg <name>.json
 24:     flag.Parse()
 25: 
 26:     fns := flag.Args()
 27:     //  ^---------------- Note the := declares fns
 28: 
 29:     if Cfg == nil {
 30:         fmt.Printf("--cfg is a required parameter\n")
 31:         os.Exit(1)
 32:     }
 33: 
 34:     gCfg, err := ReadConfig(*Cfg)
 35:     // ^ nd ^ ------------------ Multiple return values
 36:     if err != nil {
 37:         fmt.Fprintf(os.Stderr,
 38:             "Unable to read confguration: %s error %s\n",
 39:             *Cfg, err)
 40:         os.Exit(1)
 41:     }
 42: 
 43:     fmt.Printf("Congiguration: %+v\n", gCfg)
 44:     //                         ^------------------->
 45:     //               Format in print shows field names
 46:     fmt.Printf("JSON: %+v\n", IndentJSON(gCfg))
 47: 
 48:     for ii, ag := range fns {
 49:         //     ^------ Declare in scope of 'for'
 50:         //        ^------ Loop over the 'fns' slice
 51:         if ii < len(fns) {
 52:             fmt.Printf("%s ", ag)
 53:         } else {
 54:             fmt.Printf("%s", ag)
 55:         }
 56:     }
 57:     fmt.Printf("\n")
 58: }
 59: 
 60: func ReadConfig(filename string) (rv ConfigData, err error) {
 61:     var buf []byte
 62:     buf, err = ioutil.ReadFile(filename)
 63:     if err != nil {
 64:         fmt.Printf("Error: %s\n", err)
 65:         return
 66:     }
 67:     err = json.Unmarshal(buf, &rv)
 68:     if err != nil {
 69:         fmt.Printf("Error: %s\n", err)
 70:         return
 71:     }
 72:     return
 73: }
 74: 
 75: func IndentJSON(v interface{}) string {
 76:     s, err := json.MarshalIndent(v, "", "\t")
 77:     if err != nil {
 78:         return fmt.Sprintf("Error:%s", err)
 79:     } else {
 80:         return string(s)
 81:     }
 82: }
