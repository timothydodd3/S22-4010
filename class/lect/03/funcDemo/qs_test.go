package main_test

import (
	"reflect"
	"testing"

	main "github.com/Univ-Wyo-Education/S22-4010/class/lect/02/funcDemo"
)

func Test_Qs(t *testing.T) {
	expect := []string{"abc", "ddd", "def", "ghi", "zzz"}
	data := []string{"def", "ghi", "abc", "ddd", "zzz"}

	rv := main.Qs(data)
	if len(rv) != len(expect) {
		t.Errorf("Expected %v got %v\n", expect, rv)
	}
	if !reflect.DeepEqual(rv, expect) {
		t.Errorf("Expected %v got %v\n", expect, rv)
	}

}
