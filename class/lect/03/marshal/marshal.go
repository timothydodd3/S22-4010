package main

import (
	"encoding/json"
	"fmt"
)

type Demo struct {
	Aa int
	Ab string
}

func main() {
	d := Demo{
		Aa: 33,
		Ab: "Penguines are People Too...",
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
