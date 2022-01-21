package main

import (
	"encoding/json"
	"fmt"
)

type Demo struct {
	Aa int `json:"A_cx"`
	Ab string
}

func main() {
	s := `{
		"A_cx": 33,
		"Ab": "Penguines are People Too...",
		"Ac": "skips this, no error"
	}`

	var d Demo
	err := json.Unmarshal([]byte(s), &d)
	if err != nil {
		fmt.Printf("Error: %s\n", err)
	}

	fmt.Printf("%+v\n", d)
}
