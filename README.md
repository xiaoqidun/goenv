# goenv
golang environment

# docker

## 拉取镜像
```
docker pull xiaoqidun/goenv:latest
```

## 运行镜像
```
docker run -it --rm xiaoqidun/goenv
```

# 交叉编译
> 以编译android arm64程序为例

```shell
export CC=aarch64-linux-android21-clang
export GOOS=android
export GOARCH=arm64
export CGO_ENABLED=1
go build -o main_android_arm64 main.go
```

# 编译项目

## 将项目文件映射到容器内部

### linux - bash

```shell
docker run --rm -it -v $(pwd):/go/src/app -w /go/src/app xiaoqidun/goenv
```

### windows - cmd
```bat
docker run --rm -it -v %cd%:/go/src/app -w /go/src/app xiaoqidun/goenv
```

## 在容器内执行命令进行编译
```shell
export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=0
go build -o main_windows_amd64.exe main.go
```