  1: package main
  2: 
  3: import (
  4:     "flag"
  5:     "fmt"
  6:     "os"
  7: 
  8:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/cli"
  9:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/config"
 10: )
 11: 
 12: func main() {
 13: 
 14:     os.Mkdir("./data", 0766)
 15: 
 16:     //
 17:     //    TODO: AS-02 -- Add in the flags.
 18:     //
 19:     // Flags
 20:     //    --cfg cfg.json
 21:     //  --create-gensisi
 22:     //  --test-read-block
 23:     //  --test-write-block
 24:     //
 25:     // xyzzy - remove for class --------------------------------------------------------------------------------------------
 26:     var Cfg = flag.String("cfg", "cfg.json", "config file for this call")
 27:     var CreateGenesisFlag = flag.Bool("create-genesis", false, "init command")
 28:     var TestReadBlockFlag = flag.Bool("test-read-block", false, "test read a block")
 29:     var TestWriteBlockFlag = flag.Bool("test-write-block", false, "test write a block")
 30: 
 31:     flag.Parse() // Parse CLI arguments to this, --cfg <name>.json
 32: 
 33:     fns := flag.Args()
 34: 
 35:     if Cfg == nil {
 36:         fmt.Printf("--cfg is a required parameter\n")
 37:         os.Exit(1)
 38:     }
 39: 
 40:     err := config.ReadConfig(*Cfg)
 41:     if err != nil {
 42:         fmt.Fprintf(os.Stderr, "Unable to read confguration: %s error %s\n", *Cfg, err)
 43:         os.Exit(1)
 44:     }
 45: 
 46:     // Commands
 47:     //        create-genesis
 48:     //        test-read-block
 49:     //        test-write-write
 50:     //  More to come
 51: 
 52:     gCfg := config.GetGlobalConfig()
 53:     cc := cli.NewCLI(gCfg)
 54: 
 55:     if *CreateGenesisFlag {
 56:         cc.CreateGenesis(fns)
 57:     } else if *TestReadBlockFlag {
 58:         cc.TestReadBlock(fns)
 59:     } else if *TestWriteBlockFlag {
 60:         cc.TestWriteBlock(fns)
 61:     } else {
 62:         cc.Usage()
 63:         os.Exit(1)
 64:     }
 65: 
 66: }
