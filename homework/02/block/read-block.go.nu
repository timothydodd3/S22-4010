  1: package block
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6:     "io/ioutil"
  7: 
  8:     "github.com/pschlump/godebug"
  9: )
 10: 
 11: // ReadBlock reads in from a file a block and returns it.
 12: func ReadBlock(fn string) (bk *BlockType, err error) {
 13:     data, err := ioutil.ReadFile(fn)
 14:     if err != nil {
 15:         fmt.Printf("Unable to read genesis block %s [at %s], %s\n", fn, godebug.LF(), err)
 16:         return nil, err
 17:     }
 18:     bk = &BlockType{}
 19:     err = json.Unmarshal(data, bk)
 20:     if !IsGenesisBlock(bk) {
 21:         fmt.Printf("Unable to read genesis block %s [at %s], %s\n", fn, godebug.LF(), err)
 22:         return nil, err
 23:     }
 24:     return bk, nil
 25: }
 26: 
 27: // WriteBlock read i;n a block from a file.
 28: func WriteBlock(fn string, bk *BlockType) (err error) {
 29: 
 30:     data := IndentJSON(bk)
 31: 
 32:     err = ioutil.WriteFile(fn, []byte(data), 0644)
 33: 
 34:     return
 35: }
 36: 
 37: // IndentJSON converts data to JSON format and returns it as a string.
 38: func IndentJSON(v interface{}) string {
 39:     s, err := json.MarshalIndent(v, "", "\t")
 40:     if err != nil {
 41:         return fmt.Sprintf("Error:%s", err)
 42:     } else {
 43:         return string(s)
 44:     }
 45: }
