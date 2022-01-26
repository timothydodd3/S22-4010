package main

import (
	"encoding/json"
	"fmt"
)

type Demo struct {
	Aa int
	Ab string
	xy int
}

func main() {
	d := Demo{
		Aa: 33,
		Ab: "Penguines are People Too...",
		xy: 9999999,
	}

	buf, err := json.Marshal(d)
	if err != nil {
		fmt.Printf("Error: %s\n", err)
	}

	fmt.Printf("%s\n", buf)

	buf, err = json.MarshalIndent(d, "", "\t")
	if err != nil {
		fmt.Printf("Error: %s\n", err)
	}

	fmt.Printf("%s\n", buf)
}
