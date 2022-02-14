module github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle v0.0.1
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/transactions v0.0.1
	github.com/pschlump/godebug v1.0.4
)

require (
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mattn/go-isatty v0.0.5 // indirect
	github.com/pschlump/MiscLib v1.0.3
	github.com/pschlump/ansi v1.0.1
)

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle => ../merkle

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/transactions => ../transactions

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/addr => ../addr
