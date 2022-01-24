  1: package block
  2: 
  3: import (
  4:     "fmt"
  5:     "testing"
  6: )
  7: 
  8: func Test_GenesisBlock(t *testing.T) {
  9:     gb := InitGenesisBlock()
 10:     if !IsGenesisBlock(gb) {
 11:         t.Errorf("Should be genesis block")
 12:     }
 13: }
 14: 
 15: func Test_InitBlock(t *testing.T) {
 16:     bk := InitBlock(12, "Hello World", []byte{1, 2, 3})
 17:     if IsGenesisBlock(bk) {
 18:         t.Errorf("Should not be genesis block")
 19:     }
 20:     if bk.Index != 12 {
 21:         t.Errorf("Expected index of 12")
 22:     }
 23:     exp := "592fa743889fc7f92ac2a37bb1f5ba1daf2a5c84741ca0e0061d243a2e6707ba"
 24:     got := fmt.Sprintf("%x", bk.ThisBlockHash)
 25:     if exp != got {
 26:         t.Errorf("Block hash incorrect, expected ->%s<- got ->%s<-", exp, got)
 27:     }
 28: }
 29: 
 30: //
 31: func Test_SerializeBlock(t *testing.T) {
 32:     bk := InitBlock(12, "Good Morning 4010/5010 class", []byte{1, 2, 3, 4})
 33:     data := SerializeBlock(bk)
 34:     dataStr := fmt.Sprintf("%x", data)
 35:     testDataStr := "476f6f64204d6f726e696e6720343031302f3530313020636c617373"
 36:     if dataStr != testDataStr {
 37:         t.Errorf("Invalid data for block, expected %s got %s", testDataStr, dataStr)
 38:     }
 39: }
 40: 
 41: //
 42: func Test_SerializeForSeal(t *testing.T) {
 43:     bk := InitBlock(12, "Good Morning 4010/5010 class", []byte{1, 2, 3, 4})
 44:     data := SerializeForSeal(bk)
 45:     dataStr := fmt.Sprintf("%x", data)
 46:     testDataStr := "476f6f64204d6f726e696e6720343031302f3530313020636c617373855dacd594fe8549500a64210b373222f9c06ecc2a25b3530334b404081166bc010203040000000000000000"
 47:     if dataStr != testDataStr {
 48:         t.Errorf("Invalid data for block, expected %s got %s", testDataStr, dataStr)
 49:     }
 50: }
