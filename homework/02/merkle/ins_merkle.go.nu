  1: package merkle
  2: 
  3: import (
  4:     "fmt"
  5: 
  6:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
  7: )
  8: 
  9: /*
 10:    ### Pseudo Code
 11: 
 12:    1. Create a slice to hold the hashes of the leaves.  Each leaf hash is a `[]byte`.  So make the data type `[][]byte`.
 13:        Make this slice of slice of byte then length of the data.  That would be `len(data)`.  Let's call this `hTmp`.
 14:    2. For each data block
 15:        1. Calculate a hash for the data block using `hash.HashOf()`.
 16:        2. Save this in the slice created in (1) above.
 17:    3. Create a `[][]byte` slice to hold the intermediate hashes in the tree.
 18:        This will need to be no more than `len(data)/2+1` in length.  The plus 1 is so that 0 blocks of hashing or an odd
 19:        number of blocks will have enough space.  Let's call this `hMid`.
 20:    4. Declare a variable `ln`, and set it to  `len(data)/2+1`
 21:    5. While `ln >= 1` (Hint: the language only has `for` loops with lots of different ways of doing it)
 22:        1. For each pair of hashes (if you have an odd number just use the single hash)
 23:            - Calculate the hash of the pair using `hash.Keccak256()`.  It takes a variable number of arguments so you can
 24:              pass 1 or 2 arguments to it.
 25:            - Append this to `hMid`.
 26:        2. Replace hTmp with hMid
 27:        3. Recalculate `ln` set it to `len(hTmp)/2`
 28:        4. Generate a new empty hMid of allocated space of `len(hTmp)/2`.
 29:    6. Return `hTmp[0]`
 30: */
 31: 
 32: func InstructorMerkleHash(data [][]byte) []byte {
 33:     // Build a place to put the hashes for the leaves
 34:     hLeaf := make([][]byte, 0, len(data))
 35:     // Calculate Leaf Hashes
 36:     for ii := range data {
 37:         aHash := hash.HashOf(data[ii])
 38:         hLeaf = append(hLeaf, aHash)
 39:         // fmt.Printf("%d\n", aHash)
 40:     }
 41:     // fmt.Printf("Leaf Hashes len %d : %s, AT: %s\n", len(hLeaf), dumpSSB(hLeaf), godebug.LF())
 42:     hMid := make([][]byte, 0, (len(hLeaf)/2)+1)
 43:     ln := len(hLeaf)/2 + 1
 44:     // fmt.Printf("ln=%d AT:%s\n", ln, godebug.LF())
 45:     for ln >= 1 {
 46:         // fmt.Printf("\n%s-------- TOP -------- AT:%s Len(%d) %s\n", MiscLib.ColorGreen, godebug.LF(), len(hLeaf), MiscLib.ColorReset)
 47:         for ii := 0; ii < len(hLeaf); ii += 2 {
 48:             // fmt.Printf("ii+1 = %d len(hLeaf) = %d AT:%s\n", ii+1, len(hLeaf), godebug.LF())
 49:             if ii+1 < len(hLeaf) {
 50:                 hT := hash.Keccak256(hLeaf[ii], hLeaf[ii+1])
 51:                 hMid = append(hMid, hT)
 52:                 // fmt.Printf("AT:%s\n", godebug.LF())
 53:             } else {
 54:                 hT := hash.Keccak256(hLeaf[ii])
 55:                 hMid = append(hMid, hT)
 56:                 // fmt.Printf("AT:%s\n", godebug.LF())
 57:             }
 58:         }
 59:         hLeaf = hMid
 60:         ln = len(hLeaf) / 2
 61:         hMid = make([][]byte, 0, ln)
 62:         // fmt.Printf("ln = %d Mid Hashes : %s, AT: %s\n", ln, dumpSSB(hLeaf), godebug.LF())
 63:     }
 64:     // fmt.Printf("\nFinal Hash : %s, AT: %s\n", dumpSSB(hLeaf), godebug.LF())
 65:     return hLeaf[0]
 66: }
 67: 
 68: func dumpSSB(x [][]byte) (s string) {
 69:     s = "["
 70:     com := ""
 71:     for ii := range x {
 72:         st := fmt.Sprintf("%x", x[ii])
 73:         s += com + st
 74:         com = ", "
 75:     }
 76:     s += "]"
 77:     return
 78: }
