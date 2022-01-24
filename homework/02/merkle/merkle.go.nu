  1: package merkle
  2: 
  3: // TODO - uncomment the imports when you build your code.
  4: /*
  5: import (
  6:     "fmt"
  7: 
  8:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
  9: )
 10: */
 11: 
 12: func MerkleHash(data [][]byte) []byte {
 13:     // Replace this line with your code
 14:     /*
 15:        ### Pseudo Code
 16: 
 17:        1. Create a slice to hold the hashes of the leaves.  Each leaf hash is a `[]byte`.  So make the data type `[][]byte`.
 18:            Make this slice of slice of byte then length of the data.  That would be `len(data)`.  Let's call this `hTmp`.
 19:        2. For each data block
 20:            1. Calculate a hash for the data block using `hash.HashOf()`.
 21:            2. Save this in the slice created in (1) above.
 22:        3. Create a `[][]byte` slice to hold the intermediate hashes in the tree.
 23:            This will need to be no more than `len(data)/2+1` in length.  The plus 1 is so that 0 blocks of hasing or an odd
 24:            number of blocks will have enough space.  Let's call this `hMid`.
 25:        4. Declare a variable `ln`, and set it to  `len(data)/2+1`
 26:        5. While `ln >= 1` (Hint: the language only has `for` loops with lots of different ways of doing it)
 27:            1. For each pair of hashes (if you have an odd number just use the single hash)
 28:                - Calculate the hash of the pair using `hash.Keccak256()`.  It takes a variable number of arguments so you can
 29:                  pass 1 or 2 arguments to it.
 30:                - Append this to `hMid`.
 31:            2. Replace hTmp with hMid
 32:            3. Recalculate `ln` set it to `len(hTmp)/2`
 33:            4. Generate a new empty hMid of allocated space of `len(hTmp)/2`.
 34:        6. Return `hTmp[0]`
 35:     */
 36:     // return []byte{0x1} // remove this line - repalce with your own return
 37:     return InstructorMerkleHash(data)
 38: }
