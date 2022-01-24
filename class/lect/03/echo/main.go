package main

import (
	"fmt"
	"os"
)

func main() {
	for i, s := range os.Args {
		if i == 0 {
		} else if i == len(os.Args)-1 {
			fmt.Printf("%s\n", s)
		} else {
			fmt.Printf("%s ", s)
		}
	}
}
