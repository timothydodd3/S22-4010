  1: package main
  2: 
  3: import (
  4:     "encoding/json"
  5:     "fmt"
  6:     "io/ioutil"
  7: )
  8: 
  9: /*
 10: Use the following structure to read a JSON file.  Create a program that will read
 11: JSON in, print it, write it out in a new JSON file.   Get the file name for the input
 12: and output from the command line.
 13: 
 14: Add a map/dictionary field in the JSON input that is
 15: 
 16: ```
 17:     {
 18:         "TxHash": "Your actual Name",
 19:         "TxIn": 22,
 20:         "TxOut": 44
 21:     }
 22: ```
 23: 
 24: Example Run:
 25: 
 26: ```SH
 27:     ./read-json1 --input in.json --output out.json
 28: ```
 29: 
 30: The struct to include in your code.
 31: 
 32: ```Go
 33:     type TransactionType struct {
 34:         TxHash    string
 35:         TxIn    int
 36:         TxOut    int
 37:     }
 38: ```
 39: 
 40: You will need to use:
 41: 
 42: 1. `ioutil.WriteFile` [ioutil package](https://golang.org/pkg/io/ioutil/)
 43: 2. `IndentJSON` from above.
 44: 
 45: Submit:
 46: 
 47: 1. Your program.
 48: 2. Your JSON input file.
 49: 3. Your JSON output file.
 50: 
 51: ### References
 52: 
 53: 1. [ioutil package](https://golang.org/pkg/io/ioutil/)
 54: */
 55: 
 56: type TransactionType struct {
 57:     TxHash string
 58:     TxIn   int
 59:     TxOut  int
 60: }
 61: 
 62: func main() {
 63: 
 64:     data, err := ioutil.ReadFile("data.json")
 65:     _ = err
 66: 
 67:     var tt TransactionType
 68: 
 69:     err = json.Unmarshal(data, &tt)
 70:     _ = err
 71: 
 72:     fmt.Printf("%+v\n", tt)
 73: 
 74:     tt.TxHash = "Colin"
 75:     // tt.TxIn = 1000
 76: 
 77:     buf, err := json.Marshal(tt)
 78:     _ = err
 79: 
 80:     fmt.Printf("Data: %s\n", buf)
 81: 
 82: }
