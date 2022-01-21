  1: package main
  2: 
  3: import (
  4:     "fmt"
  5:     "testing"
  6: )
  7: 
  8: func Test_KSum(t *testing.T) {
  9:     expect := "ecd67ca5a72802084fcea4883b6877ecfba7f95c0aece07ea504359d54eb461f"
 10:     data := `ksum
 11: ksum.go
 12: `
 13: 
 14:     rv := Keccak256([]byte(data))
 15:     if fmt.Sprintf("%x", rv) != expect {
 16:         t.Errorf("Expected 0x%s got 0x%x\n", expect, rv)
 17:     }
 18: 
 19: }
