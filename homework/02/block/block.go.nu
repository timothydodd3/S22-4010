  1: package block
  2: 
  3: import (
  4:     "bytes"
  5:     "encoding/binary"
  6: 
  7:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
  8: )
  9: 
 10: // GenesisDesc is the constant that marks that a block is a genesis block.
 11: const GenesisDesc = "GenesisBlock Fri Aug 17 23:16:12 MDT 2018"
 12: 
 13: // BlockType is a single block in the block chain.
 14: type BlockType struct {
 15:     Index         int                // position of this block in the chain, 0, 1, 2, ...
 16:     Desc          string             // if "genesis" string then this is a genesis block.
 17:     ThisBlockHash hash.BlockHashType //
 18:     PrevBlockHash hash.BlockHashType // This is 0 length if this is a "genesis" block
 19:     Nonce         uint64             //
 20:     Seal          hash.SealType      //
 21: 
 22:     // Add Merkle Hash to Block Later, (AS-03 will do this)
 23:     // MerkleHash hash.BlockHashType
 24: 
 25:     // Add Transactions to Block Later, (AS-04 will do this)
 26: }
 27: 
 28: // InitGenesisBlock create and return a genesis block.   This is a special
 29: // block at the beginning of a chain.
 30: func InitGenesisBlock() (gb *BlockType) {
 31:     gb = &BlockType{
 32:         Index:         0,
 33:         Desc:          GenesisDesc,
 34:         ThisBlockHash: []byte{},
 35:         PrevBlockHash: []byte{},
 36:         Nonce:         0,
 37:         Seal:          []byte{},
 38: 
 39:         // Add fields in AS-03
 40:         // MerkleHash:          []byte{},
 41: 
 42:         // Add fields in AS-04
 43:     }
 44:     gb.ThisBlockHash = hash.HashOf(SerializeBlock(gb))
 45:     return
 46: }
 47: 
 48: // InitBlock creates and returns a block.
 49: func InitBlock(ii int, dd string, prev hash.BlockHashType) (bk *BlockType) {
 50:     bk = &BlockType{
 51:         Index:         ii,
 52:         Desc:          dd,
 53:         ThisBlockHash: []byte{},
 54:         PrevBlockHash: prev,
 55:         Nonce:         0,
 56:         Seal:          []byte{},
 57: 
 58:         // Add fields in AS-03
 59:         // MerkleHash:          []byte{},
 60: 
 61:         // Add fields in AS-04
 62:     }
 63:     bk.ThisBlockHash = hash.HashOf(SerializeBlock(bk))
 64:     return
 65: }
 66: 
 67: // IsGenesisBlock returns true if this is a genisis block.
 68: func IsGenesisBlock(bk *BlockType) bool {
 69:     if bk.Desc == GenesisDesc && len(bk.PrevBlockHash) == 0 {
 70:         return true
 71:     }
 72:     return false
 73: }
 74: 
 75: // SearalizeBlock searializes into bytes the fields that will be hashed the hash of the block.
 76: // This is the hash that the next block will use to point to this block and the hash that
 77: // this block will be saved as.
 78: func SerializeBlock(bk *BlockType) []byte {
 79:     var buf bytes.Buffer
 80: 
 81:     binary.Write(&buf, binary.BigEndian, bk.Index)
 82: 
 83:     buf.Write([]byte(bk.Desc))
 84: 
 85:     // Additional fields will need to be added at this point. (AS-03)
 86:     // MerkleHash:          []byte{},
 87: 
 88:     // Additional fields will need to be added at this point. (AS-04)
 89: 
 90:     return buf.Bytes()
 91: }
 92: 
 93: // SearalizeForSeal searializes into bytes the fields that will be hashed for the mining seal.
 94: func SerializeForSeal(bk *BlockType) []byte {
 95:     var buf bytes.Buffer
 96: 
 97:     binary.Write(&buf, binary.BigEndian, bk.Index)
 98: 
 99:     buf.Write([]byte(bk.Desc))
100: 
101:     buf.Write([]byte(bk.ThisBlockHash))
102: 
103:     buf.Write([]byte(bk.PrevBlockHash))
104: 
105:     binary.Write(&buf, binary.BigEndian, bk.Nonce)
106: 
107:     // Additional fields will need to be added at this point. (AS-03)
108:     // MerkleHash:          []byte{},
109: 
110:     // Additional fields will need to be added at this point. (AS-04)
111: 
112:     return buf.Bytes()
113: }
