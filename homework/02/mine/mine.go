package mine

//Timothy Dodd
//02/02/2022
//COSC 4010: Assignemnt 2. Mining and Merkle Hash, Part1: Mining

// TODO Replace above import with import below (commented out)
import (
	"encoding/hex"
	"fmt"

	// "hash"

	"github.com/Univ-Wyo-Education/S22-4010/homework/02/block"
	"github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
)

func MineBlock(bk *block.BlockType, difficulty string) {
	for {
		//Gets the Hasf Value of the Block
		theHashOfTheBlock := block.SerializeForSeal(bk)
		//Hashes the Value Serialized
		theHashAsAHash := hash.HashOf(theHashOfTheBlock)
		//Converts Hash Value to a String for printing out
		theHashAsAString := hex.EncodeToString(theHashAsAHash)
		//Prints the return value of the Hash and the current attempt
		fmt.Printf("Hash for block [%s] nonce [%8d]\r", theHashAsAString, bk.Nonce)
		//Difficulty determines the first 4 digits of correct hash
		difficulty = "0000"
		n := 4
		if theHashAsAString[0:n] == difficulty {
			//Sets the seal as the correct hash
			bk.Seal = theHashAsAHash
			//Prints the value of the correct hash and nonce
			fmt.Printf("((Mining)) Hash Block for [%s] nonce [%8d]\n", theHashAsAString, bk.Nonce)
			return
		}
		//Will increment the loop once all checks are done
		bk.Nonce++
	}

}

//Output given from the running go test on this file...
// timothydodd@Timothys-MacBook-Pro 02 % cd ./main
// timothydodd@Timothys-MacBook-Pro main % go build
// timothydodd@Timothys-MacBook-Pro main % cd '/Users/timothydodd/Documents/GitHub/S22-4010/homework/02/mine'
// timothydodd@Timothys-MacBook-Pro mine % go test
// ((Mining)) Hash Block for [0000ae2cab130b4836988969f731c4f884ac4675790e5575a5161e5b96ab13d7] nonce [   54586]
// ((Mining)) Hash Block for [0000adc29a80f1f0df08c8687c013d179050f5d1b449599e4d1437e4fad23525] nonce [   46734]
// ((Mining)) Hash Block for [000013ce557332aaa68abe3b7bf1be856743a03689a802606a732e81713bb78c] nonce [    4527]
// PASS
// ok      github.com/Univ-Wyo-Education/S22-4010/homework/02/mine 1.971s

//As for the qestion raised by Point 2 in the Pseudocode, Replacing the code with a GPU would make the code run far faster.
//And Replacing that with ASIC hardware dedicated to doing the hash would likely make it instantainous
