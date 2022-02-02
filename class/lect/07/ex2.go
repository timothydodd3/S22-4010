package main

type InterfaceSpecType interface {
	DoFirstThing(p1 int, p2 int) error
	DoSomethingElse() error
}

type InterfaceOtherType interface {
	DoSomethingElse() error
	DoSomethingSpecial(in int) error
}

type ImplementationType struct {
	AA int
	BB int
}

// Verify at compile time that the implementation type
// is a valid implementation of the interface.
var _ InterfaceSpecType = (*ImplementationType)(nil)

// Validate 2nd interface spec.
var _ InterfaceOtherType = (*ImplementationType)(nil)

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

func (xy *ImplementationType) DoSomethingSpecial(in int) error {
	// ... do something ...
	return nil
}

func Demo() {
	var dd InterfaceSpecType
	dd = NewImplementationType()
	_ = dd.DoSomethingElse()
}

func main() {
	Demo()
}
