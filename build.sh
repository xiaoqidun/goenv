#!/bin/sh
GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o release/goenv_linux_amd64 -trimpath -ldflags '-s -w' goenv.go
GOOS=darwin GOARCH=amd64 CGO_ENABLED=0 go build -o release/goenv_darwin_amd64 -trimpath -ldflags '-s -w' goenv.go
GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -o release/goenv_windows_amd64.exe -trimpath -ldflags '-s -w' goenv.go