package main

import "fmt"

var aSlice = []string{"abc", "def", "ghi"}
var aMap = map[string]int{
	"alice": 22,
	"bob":   23,
	"tom":   25,
}

func main() {
	for i := 0; i < 5; i++ {
		fmt.Printf("Loop 1: %d\n", i)
	}
	fmt.Printf("\n")

	for i, v := range aSlice {
		fmt.Printf("Loop 2: at:%d ->%s<-\n", i, v)
	}
	fmt.Printf("\n")

	for key, val := range aMap {
		fmt.Printf("Loop 3: key:%s ->%v<-\n", key, val)
	}
}
