
.PHONEY: all setup test cover

all: setup cover

setup:
		go get golang.org/x/tools/cmd/cover github.com/stretchr/testify/assert
		go get ./...

test:
		go test -v ./...

cover:
		go test -v -coverprofile=coverage.txt -covermode=count ./appstore
		go test -v -coverprofile=playstore.txt -covermode=count ./playstore
		cat playstore.txt | grep -v "mode: count" >> coverage.txt
		rm playstore.txt
