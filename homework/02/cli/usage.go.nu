  1: package cli
  2: 
  3: import (
  4:     "fmt"
  5:     "os"
  6: )
  7: 
  8: func (cc *CLI) Usage() {
  9:     fmt.Printf("got ->%s<-\n", os.Args[1])
 10:     fmt.Printf("Usage: bc02 [ --cfg cfg.json ] [ --create-genesis ] xyzzy\n")
 11: }
