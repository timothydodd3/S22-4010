package main

import (
	"fmt"

	"github.com/Univ-Wyo-Education/S22-4010/homework/01/aPkg/testPkg"
	"github.com/pschlump/godebug"
)

func main() {
	x := testPkg.AFunc()
	fmt.Printf("x=%v AT Line:%s\n", x, godebug.LF())
}
