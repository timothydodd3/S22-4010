package main

import "fmt"

func vexample(a int, b ...interface{}) {
	for pos, bVal := range b {
		switch v := bVal.(type) {
		case int:
			fmt.Printf("It's an int, %d at %d\n", v, pos)
		case []int:
			fmt.Printf("It's a slice of int\n")
		default:
			fmt.Printf("It's a something else\n")
		}
	}
}
