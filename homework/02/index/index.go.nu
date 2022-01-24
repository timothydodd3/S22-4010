  1: package index
  2: 
  3: import (
  4:     "fmt"
  5:     "io/ioutil"
  6: 
  7:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
  8:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/lib"
  9: )
 10: 
 11: /*
 12: 
 13: Example Data (sort of with stuff ...ed out)
 14:     {
 15:         "Index": [ "126c..", .... ]
 16:         "TxHashIndex": {
 17:             "1212121...": {
 18:                 "Index": 0,
 19:                 "BlockHash": "1212222",
 20:             },
 21:             "2212121...": {
 22:                 "Index": 1,
 23:                 "BlockHash": "1212222",
 24:             }
 25:         }
 26:     }
 27: 
 28: */
 29: 
 30: type TxHashIndexType struct {
 31:     Index     int
 32:     BlockHash string
 33: }
 34: 
 35: type BlockIndex struct {
 36:     Index       []string
 37:     TxHashIndex map[string]TxHashIndexType
 38: }
 39: 
 40: func ReadIndex() {
 41:     // xyzzy
 42: }
 43: 
 44: func WriteIndex(fn string, bkslice []*block.BlockType) {
 45:     indexForBlocks := BuildIndex(bkslice)
 46:     ioutil.WriteFile(fn, []byte(lib.SVarI(indexForBlocks)), 0644)
 47: }
 48: 
 49: func BuildIndex(bkslice []*block.BlockType) (idx BlockIndex) {
 50:     for _, bk := range bkslice {
 51:         idx.Index = append(idx.Index, fmt.Sprintf("%x", bk.ThisBlockHash))
 52:     }
 53:     idx.TxHashIndex = make(map[string]TxHashIndexType)
 54:     for ii, bk := range bkslice {
 55:         idx.TxHashIndex[fmt.Sprintf("%x", bk.ThisBlockHash)] = TxHashIndexType{
 56:             Index:     ii,
 57:             BlockHash: fmt.Sprintf("%x", bk.ThisBlockHash),
 58:         }
 59:     }
 60:     return
 61: }
