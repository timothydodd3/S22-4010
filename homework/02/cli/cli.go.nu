  1: package cli
  2: 
  3: import (
  4:     "fmt"
  5:     "io/ioutil"
  6:     "os"
  7:     "path/filepath"
  8: 
  9:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
 10:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/config"
 11:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/index"
 12:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/lib"
 13:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/mine"
 14: )
 15: 
 16: type CLI struct {
 17:     GCfg config.GlobalConfigData
 18: }
 19: 
 20: func NewCLI(c config.GlobalConfigData) *CLI {
 21:     return &CLI{
 22:         GCfg: c,
 23:     }
 24: }
 25: 
 26: var AllBlocks []*block.BlockType
 27: 
 28: func (cc *CLI) CreateGenesis(args []string) {
 29:     gb := block.InitGenesisBlock()
 30:     os.MkdirAll(cc.GCfg.DataDir, 0755)
 31:     fn := fmt.Sprintf("%x.json", gb.ThisBlockHash)
 32:     fnPath := filepath.Join(cc.GCfg.DataDir, fn)
 33:     if lib.Exists(fnPath) {
 34:         fmt.Printf("Error: %s already exists - you will need to remove it if you want to re-create a new chain.\n", fnPath)
 35:         return
 36:     }
 37:     mine.MineBlock(gb, cc.GCfg.MiningDifficulty)                // mine the block
 38:     AllBlocks = append(AllBlocks, gb)                           // put in set of global blocks:
 39:     fnIndexPath := filepath.Join(cc.GCfg.DataDir, "index.json") //
 40:     index.WriteIndex(fnIndexPath, AllBlocks)                    // write index
 41:     ioutil.WriteFile(fnPath, []byte(lib.SVarI(gb)), 0644)       //
 42: }
 43: 
 44: func (cc *CLI) TestReadBlock(args []string) {
 45:     fnPath := "./data/136c53391115ab7ff717bd24e62dd0df2c270500d7194290169a83488022548e.json"
 46:     if !lib.Exists(fnPath) {
 47:         fmt.Printf("You must run \"create-genesis\" first before this test.\n")
 48:         os.Exit(1)
 49:     }
 50:     _, err := block.ReadBlock("./data/136c53391115ab7ff717bd24e62dd0df2c270500d7194290169a83488022548e.json")
 51:     if err != nil {
 52:         fmt.Printf("FAIL\n")
 53:         os.Exit(1)
 54:     }
 55:     fmt.Printf("PASS\n")
 56: }
 57: 
 58: func (cc *CLI) TestWriteBlock(args []string) {
 59:     // Initialize a block
 60:     bk := block.InitBlock(12, "Good Morning 4010/5010 class", []byte{1, 2, 3, 4})
 61:     // Write out that block
 62:     block.WriteBlock("./data/TestWriteBlock.json", bk)
 63: }
