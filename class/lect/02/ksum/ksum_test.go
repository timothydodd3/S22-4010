package main

import (
	"fmt"
	"testing"
)

func Test_KSum(t *testing.T) {
	expect := "ecd67ca5a72802084fcea4883b6877ecfba7f95c0aece07ea504359d54eb461f"
	data := `ksum
ksum.go
`

	rv := Keccak256([]byte(data))
	if fmt.Sprintf("%x", rv) != expect {
		t.Errorf("Expected 0x%s got 0x%x\n", expect, rv)
	}

}
