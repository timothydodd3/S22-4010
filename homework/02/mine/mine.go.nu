  1: package mine
  2: 
  3: import block "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
  4: 
  5: // TODO Replace above import with import below (commented out)
  6: /*
  7: import (
  8:     "encoding/hex"
  9:     "fmt"
 10: 
 11:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
 12:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
 13: )
 14: */
 15: 
 16: // MineBlock implements a proof of work mining system where the first 4
 17: // digits (2 bytes) of the hex value are 0.  This is set with the difficulty
 18: // parameter.  So it could be more than 4 or less (Test with less).
 19: // Difficulty can be increaesed by requiring more digits to be 0 or by
 20: // requring some other pattern to apear in the resulting hash.
 21: func MineBlock(bk *block.BlockType, difficulty string) {
 22:     // Pseudo-Code:
 23:     //
 24:     // 1. Use an infinite loop to:
 25:     //   1. Serialize the data from the block for hashing, Call
 26:     //     `block.SearilizeForSeal` to do this.
 27:     //   2. Calculate the hash of the data, Call `hash.HashOf` to do this.
 28:     //      This is the slow part.  What would happen if we replaced the
 29:     //      software with a hash calculator on a graphics card where you
 30:     //      could run 4096 - 10240 hahes at once?  What would happen if we
 31:     //      replaced the graphics card with an ASIC - so you had dedicated
 32:     //        hardware to do the hash and you could run 4 billion hashes a
 33:     //      second?
 34:     //   3. Convert the hash (it is []byte) to a hex string.  Use the
 35:     //      `hex.EncodeToString` standard go library function.
 36:     //   4. `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\r",
 37:     //      theHashAsAString, bk.Nonce)` `\r` will overwrite the same line
 38:     //      instead of advancing to the next. (You may want to skip on
 39:     //      some windows systems)
 40:     //   5. See if the first 4 characters of the hash are 0's. - if so we
 41:     //      have met the work criteria.  In go this is
 42:     //     `if theHashAsAString[0:n] == difficulty ("0000" for example) {`.
 43:     //      This is create a slice, 4 long from character 0 with length of 4,
 44:     //      then compare that to the string `difficulty`.
 45:     //    -   Set the block's "Seal" to the hash
 46:     //    -   `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\n",
 47:     //        theHashAsAString, bk.Nonce)` `\n` will overwrite the same
 48:     //        *and then advance* to the next line.
 49:     //    -   return
 50:     //   5. Increment the Nonce in the block, and...
 51:     //   6. Back to the top of the loop for another try at finding a seal
 52:     //      for this block.
 53:     //
 54:     // For the genesis block, when I do this it requires 54586 trips through
 55:     // the loop to calculate the proof of work (PoW).
 56:     //
 57: 
 58:     // TODO: Start coding here.
 59:     InstructorImplementationMineBlock(bk, difficulty)
 60: }
