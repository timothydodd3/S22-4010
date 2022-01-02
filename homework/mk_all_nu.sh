#!/bin/bash

if ls *.go >/dev/null 2>&1 ; then
	for i in *.go ; do
		../mk_nu.sh $i
	done
fi

XXX=$(pwd)
for i in $( find . -type d -print ) ; do
	echo "dir ->${i}<-"
	cd $i

	if ls *.go >/dev/null 2>&1 ; then
		for j in *.go ; do
			${XXX}/../mk_nu.sh $j
		done
	fi

	cd $XXX
done
