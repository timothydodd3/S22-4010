package merkle

//Timothy Dodd: COSC 4010
//Assignment2: Merkle.go
//This does a merkle hash

import (
	"github.com/Univ-Wyo-Education/S22-4010/homework/02/hash"
)

func MerkleHash(data [][]byte) []byte {
	var hTmp [][]byte = make([][]byte, len(data))

	for i := 0; i < len(data); i++ {
		hTmp[i] = hash.HashOf(data[i])
		// theHashAsAString := hex.EncodeToString(hTmp[i])
		// fmt.Printf("The has as String [%s] at point [%d]\r", theHashAsAString, i)
	}
	ln := len(data)/2 + 1
	var hMid [][]byte = make([][]byte, 0, ln)
	// fmt.Printf("Length of Data [%d]\n", ln)
	if ln == 1 {
		tempHash := hash.Keccak256(hTmp[0])
		return tempHash
	}
	for ln >= 1 {
		for i := 0; i < len(hTmp); i = i + 2 {
			//fmt.Printf("Length of hMid [%d]\n", len(hTmp))
			if (i + 1) >= len(hTmp) {
				tempHash := hash.Keccak256(hTmp[i])
				hMid = append(hMid, tempHash)
				// theHashAsAString := hex.EncodeToString(hMid[i])
				// fmt.Printf("Choice 1 as String [%s] at point [%d]\n", theHashAsAString, i)
			} else {
				tempHash := hash.Keccak256(hTmp[i], hTmp[i+1])
				hMid = append(hMid, tempHash)
				// theHashAsAString := hex.EncodeToString(hMid[i])
				// fmt.Printf("Choice 2 as String [%s] at point [%d]\n", theHashAsAString, i)
			}
		}
		hTmp = hMid
		ln = len(hTmp) / 2
		hMid = make([][]byte, 0, ln)
		// fmt.Printf("The Value of ln is [%d]\n", ln)
	}
	return hTmp[0]
}
