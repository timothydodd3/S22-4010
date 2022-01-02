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
 20:     var Cfg = flag.String("cfg", "cfg.json", "config file for this call")
 21: 
 22:     flag.Parse() // Parse CLI arguments to this, --cfg <name>.json
 23: 
 24:     fns := flag.Args()
 25: 
 26:     if Cfg == nil {
 27:         fmt.Printf("--cfg is a required parameter\n")
 28:         os.Exit(1)
 29:     }
 30: 
 31:     gCfg, err := ReadConfig(*Cfg)
 32:     if err != nil {
 33:         fmt.Fprintf(os.Stderr, "Unable to read confguration: %s error %s\n", *Cfg, err)
 34:         os.Exit(1)
 35:     }
 36: 
 37:     fmt.Printf("Congiguration: %+v\n", gCfg)
 38: 
 39:     for ii, ag := range fns {
 40:         if ii < len(fns) {
 41:             fmt.Printf("%s ", ag)
 42:         } else {
 43:             fmt.Printf("%s", ag)
 44:         }
 45:     }
 46:     fmt.Printf("\n")
 47: }
 48: 
 49: func ReadConfig(filename string) (rv ConfigData, err error) {
 50:     var buf []byte
 51:     buf, err = ioutil.ReadFile(filename)
 52:     if err != nil {
 53:     }
 54:     err = json.Unmarshal(buf, &rv)
 55:     if err != nil {
 56:     }
 57:     return
 58: }
