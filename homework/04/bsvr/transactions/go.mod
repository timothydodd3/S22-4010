module github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/transactions

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash v0.0.2
	github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle v0.0.2
	github.com/pschlump/godebug v1.0.4
)

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/block => ../block

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/cli => ../cli

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/config => ../config

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/index => ../index

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/mine => ../mine

replace github.com/Univ-Wyo-Education/S22-4010/homework/04/bsvr/merkle => ../merkle

replace golang.org/x/crypto => ../../../../../../../golang.org/x/crypto
