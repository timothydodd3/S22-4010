Last Part on Go
======================

Goroutines
------------------------------

Go routes allow you to create parallel running code.


```
m4_include(ex0.go.nu)
```





Go Interfaces
------------------------------

Two uses for interfaces (Actually more than 2 but 2 primary uses).

1. Variable parameter list functions.
2. Interfaces to sets of functions.

## Variable parameter list functions.

```Go
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

```

## Interfaces to sets of functions.

```Go
type InterfaceSpecType interface {
	DoFirstThing(p1 int, p2 int) error
	DoSomethingElse() error
}

type ImplementationType struct {
	AA int
	BB int
}

var _ InterfaceSpecType = (*ImplementationType)(nil)

func NewImplementationType() InterfaceSpecType {
	return &ImplementationType{
		AA: 1,
		BB: 2,
	}
}

func (xy *ImplementationType) DoFirstThing(p1 int, p2 int) error {
	// ... do something ...
	return nil
}

func (xy *ImplementationType) DoSomethingElse() error {
	// ... do something ...
	return nil
}

func Demo() {
	var dd InterfaceSpecType
	dd = NewImplementationType()
	_ = dd.DoSomethingElse()
}
```

Go Channels
------------------------------

We will come back to this later.


Go Weaknesses
------------------------------

What are the limitations of using Go

1. No objects - Use interfaces instead.  No inheritance.
2. Executables are big



