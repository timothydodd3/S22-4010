module github.com/Univ-Wyo-Education/S22-4010/homework/02/hash

go 1.17

require (
	github.com/Univ-Wyo-Education/S22-4010/homework/02/lib v0.0.1
	golang.org/x/crypto v0.0.0-20220112180741-5e0467b6c7ce
)

require golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1 // indirect

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/block => ../block

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/cli => ../cli

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/config => ../config

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/hash => ../hash

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/index => ../index

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/lib => ../lib

replace github.com/Univ-Wyo-Education/S22-4010/homework/02/mine => ../mine
