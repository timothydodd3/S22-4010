
PP=`pwd`
FN=Intro-To-Go
DIR=../../
IMG=
PY=  \
	ans/hello-world.go \
	ans/hw.go \
	echo1/echo1.go \
	echo2/echo2.go \
	hello-world/hw.go \
	ksum/ksum.go \
	mkPkg/main.go \
	print1/main.go \
	read-json1/ex.go

all: setup all2

setup:
	../mk_all_nu.sh

all2: ${FN}.html ${FN}.md ${PY}


test: test01 test02
.PHONEY: test test01 test02

test01:
	( cd hello-world ; go build ; ./hello-world ) >,a
	diff ,a ref/hw.out

test02:
	( cd echo1 ; go build ; ./echo1 a b c X ) >,b
	diff ,b ref/echo1.out

clean:
	rm ,a ,b echo1/echo1 hello-world/hello-world ksum/ksum


.PRECIOUS: %.md 
%.md: %.raw.md $(PY) $(IMG)
	m4 -P $< >$@

%.html: %.md
	blackfriday-tool ./$< $@
	echo cat ./${DIR}/css/md.css $@ >/tmp/$@
	cat ./${DIR}/css/pre ./${DIR}/css/markdown.css ./${DIR}/css/post ./${DIR}/css/md.css ./${DIR}/css/hpre $@ ./${DIR}/css/hpost >/tmp/$@
	mv /tmp/$@ ./$@
	echo "file://${PP}/$@" >>open.1

