package main

// Your Name - it is important if you want to get credit for your assignment.
// Assignment 1.3 echo command line arguments.

import (
	"fmt"
	"os"
)

func main() {
	ags := os.Args[1:]
	//  ^-------------------------- Declare
	//     ^----------------------- use "os" package
	//        ^-------------------- Command line arguments
	//            ^---------------- Arguments are an array
	//             ^--- 1: -------- this is a sub-slice of array
	for ii, ag := range ags {
		if ii < len(ags)-1 {
			fmt.Printf("%s ", ag)
		} else {
			fmt.Printf("%s", ag)
		}
	}
	fmt.Printf("\n")
}
