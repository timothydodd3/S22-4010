module github.com/Univ-Wyo-Education/S22-4010/homework/01/mkPkg

go 1.17

require github.com/pschlump/myPkg/test1 v0.0.1

replace github.com/pschlump/myPkg/test1 => ./test1
