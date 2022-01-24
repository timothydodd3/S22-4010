  1: package mine
  2: 
  3: import (
  4:     "encoding/hex"
  5:     "fmt"
  6:     "runtime"
  7: 
  8:     block "github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
  9:     "github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
 10: )
 11: 
 12: // MineBlock implements a proof of work mining system where the first 4 digits (2 bytes) of the hex value are 0.
 13: // Difficulty can be increaesed by requiring more digits to be 0 or by requring some other pattern to apear in
 14: // the resulting hash.
 15: func InstructorImplementationMineBlock(bk *block.BlockType, difficulty string) {
 16:     // Pseudo-Code
 17:     //
 18:     // 1. Use an infinite loop to:
 19:     //        1. Searilize the data from the block for hasing, Call block.SerializeForSeal to do this.
 20:     //        2. Calculate the hash of the data, Call hash.HashOf to do this. This is the slow part.  What would happen if we
 21:     //         replaced the software with a hash calculator on a graphics card where you could run 4096 hahes at once?
 22:     //           What would happen if we replaced the graphics card with an ASIC - so you had dedicated hardware to do
 23:     //         the hash and you could run 4 billion hashes a second?
 24:     //        3. Convert the hash (it is []byte) to a hex string.  Use the hex.EncodeToString standard go library function.
 25:     //        4. `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\r", theHashAsAString, bk.Nonce)`
 26:     //            `\r` will overwrite the same line instead of advancing to the next.
 27:     //        5. See if the first 4 characters of the hash are 0's. - if so we have met the work criteria.
 28:     //            In go this is `if theHashAsAString[0:4] == "0000" {`.  This is create a slice, 4 long from
 29:     //            character 0 with length of 4, then compare that to the string `"0000"`.
 30:     //            - Set the blcoks "Seal" to the hash
 31:     //            - `fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\n", theHashAsAString, bk.Nonce)`
 32:     //              `\n` will overwrite the same *and then advance* to the next line.
 33:     //            - return
 34:     //        5. Increment the Nonce in the block, and...
 35:     //        6. Back to the top of the loop for another try at finding a seal for this block.
 36:     //
 37:     // For the genesis block, when I do this it requires 54586 trips through the loop to calculate the
 38:     // proof of work.
 39:     //
 40:     for {
 41:         data := block.SerializeForSeal(bk)
 42:         hh := hash.HashOf(data)
 43:         hhStr := hex.EncodeToString(hh)
 44:         if runtime.GOOS != "windows" {
 45:             fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\r", hhStr, bk.Nonce)
 46:         }
 47:         if len(difficulty) == 0 || hhStr[0:len(difficulty)] == difficulty {
 48:             bk.Seal = hh
 49:             fmt.Printf("((Mining)) Hash for Block [%s] nonce [%8d]\n", hhStr, bk.Nonce)
 50:             return
 51:         }
 52:         bk.Nonce++
 53:     }
 54: }
