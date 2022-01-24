  1: package main
  2: 
  3: import (
  4:     "flag"
  5:     "fmt"
  6:     "io/ioutil"
  7:     "os"
  8: 
  9:     "golang.org/x/crypto/sha3"
 10: )
 11: 
 12: func main() {
 13:     flag.Parse()
 14: 
 15:     fns := flag.Args()
 16:     if len(fns) == 0 {
 17:         fmt.Fprintf(os.Stderr, "Usage: ./ksum [file ...]\n")
 18:         os.Exit(1)
 19:     }
 20: 
 21:     for _, fn := range fns {
 22:         data, err := ioutil.ReadFile(fn)
 23:         if err != nil {
 24:             fmt.Fprintf(os.Stderr, "Unable to read %s, error: %s\n", fn, err)
 25:             continue
 26:         }
 27:         fmt.Printf("%s %x\n", fn, Keccak256(data))
 28:     }
 29: }
 30: 
 31: // Keccak256 calculates and returns the Keccak256 hash of the input data.
 32: func Keccak256(data ...[]byte) []byte {
 33:     d := sha3.NewLegacyKeccak256()
 34:     for _, b := range data {
 35:         d.Write(b)
 36:     }
 37:     return d.Sum(nil)
 38: }
