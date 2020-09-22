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