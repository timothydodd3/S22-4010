  1: package mine
  2: 
  3: import "github.com/Univ-Wyo-Education/S20-4010/Assignments/02/block"
  4: 
  5: /*
  6:  import (
  7:      "encoding/hex"
  8:      "fmt"
  9:      "strings"
 10: 
 11:      block "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
 12:      "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
 13:  )
 14: */
 15: 
 16: // MineBlock implements a proof of work mining system where the first 4 digits (2 bytes) of the hex value are
 17: // 0000.  Difficulty can be increaesed by requiring more digits to be 0 or by requring some other pattern to
 18: // apear in the resulting hash.
 19: func InstructorImplementationMineBlock(bk *block.BlockType, difficulty string) {
 20:     // Pseudo-Code
 21:     //
 22:     // 1. Use an infinite loop to:
 23:     //    1. Searilize the data from the block for hasing, Call block.SerializeForSeal to do this.
 24:     //    2. Calculate the hash of the data, Call hash.HashOf to do this. This is the slow part.  What would
 25:     //      happen if we replaced the software with a hash calculator on a graphics card where you could run
 26:     //      4096 hahes at once?  What would happen if we replaced the graphics card with an ASIC - so you had
 27:     //      dedicated hardware to do the hash and you could run 4 billion hashes a second?
 28:     //    3. Convert the hash (it is []byte) to a hex string.  Use the hex.EncodeToString standard go library
 29:     //      function.
 30:     //    4. `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\r", theHashAsAString, bk.Nonce)`
 31:     //        `\r` will overwrite the same line instead of advancing to the next.
 32:     //    5. See if the first 4 characters of the hash are 0's. - if so we have met the work criteria.
 33:     //        In go this is `if theHashAsAString[0:4] == "0000" {`.  This is create a slice, 4 long from
 34:     //        character 0 with length of 4, then compare that to the string `"0000"`.
 35:     //        - Set the blcoks "Seal" to the hash
 36:     //        - `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\n", theHashAsAString, bk.Nonce)`
 37:     //          `\n` will overwrite the same *and then advance* to the next line.
 38:     //        - return
 39:     //    5. Increment the Nonce in the block, and...
 40:     //    6. Back to the top of the loop for another try at finding a seal for this block.
 41:     //
 42:     // For the genesis block, when I do this it requires 54586 trips through the loop to calculate the
 43:     // proof of work.
 44:     //
 45:     for {
 46:         // YOur Code at this point ---------------------------------------------------------------------------
 47:         // seralize the block
 48:         // hash the block
 49:         // convert hash to string. (use hex library package)
 50:         // If the first X characters of the string - match with our passed difficulty (use strings.HasPrefix?)
 51:         //         Set "Seal" field to the hash
 52:         //         Return
 53:         // Increment block Nonce
 54:     }
 55: }
