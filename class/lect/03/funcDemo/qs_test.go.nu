  1: package main_test
  2: 
  3: import (
  4:     "reflect"
  5:     "testing"
  6: 
  7:     main "github.com/Univ-Wyo-Education/S22-4010/class/lect/02/funcDemo"
  8: )
  9: 
 10: func Test_Qs(t *testing.T) {
 11:     expect := []string{"abc", "ddd", "def", "ghi", "zzz"}
 12:     data := []string{"def", "ghi", "abc", "ddd", "zzz"}
 13: 
 14:     rv := main.Qs(data)
 15:     if len(rv) != len(expect) {
 16:         t.Errorf("Expected %v got %v\n", expect, rv)
 17:     }
 18:     if !reflect.DeepEqual(rv, expect) {
 19:         t.Errorf("Expected %v got %v\n", expect, rv)
 20:     }
 21: 
 22: }
