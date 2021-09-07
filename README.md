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

### windows - powershell
```powershell
docker run --rm -it -v "${pwd}:/go/src/app" -w /go/src/app xiaoqidun/goenv
```

## 在容器内执行命令进行编译

### 编译linux程序
```shell
export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0
go build -o main_linux_amd64 main.go
```

### 编译android程序
```shell
export CC=aarch64-linux-android21-clang
export GOOS=android
export GOARCH=arm64
export CGO_ENABLED=1
go build -o main_android_arm64 main.go
```

### 编译windows程序
```shell
export GOOS=windows
export GOARCH=amd64
export CGO_ENABLED=0
go build -o main_windows_amd64.exe main.go
```

# 编译说明

## GOOS
> 用于标识编译的目标操作系统

## GOARCH
> 用于标识编译的目标系统架构

## CGO_ENABLED
- 0 静态编译，禁用CGO，适用于android和darwin(apple)外的目标操作系统
- 1 动态编译，使用CGO，适用于依靠外部工具链才能完成编译的目标操作系统

## 动态编译
- 动态编译必须设置CC变量，指定C编译器可执行文件路径或者在PATH变量内的可执行C编译器名称

# 快捷命令 - goenv
> 运行一个goenv容器并将当前目录挂载到容器的工作目录

## 快速安装
```shell
go install github.com/xiaoqidun/goenv@latest
```

## 手动安装
1. 根据系统架构下载为你编译好的[二进制文件](https://aite.xyz/product/goenv/)
2. 将下载好的二进制文件重命名为goenv并保留后缀
3. 把goenv文件移动到系统PATH环境变量中的目录下
4. windows外的系统需使用chmod命令赋予可执行权限
