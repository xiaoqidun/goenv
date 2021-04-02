# 基础镜像
FROM golang:1.16.3-buster

# 作者信息
LABEL MAINTAINER="xiaoqidun@gmail.com"

# 安装编译工具链
RUN apt-get update \
    && apt-get install -y \
    build-essential mingw-w64 upx-ucl strace htop file zip

# 安装android ndk
COPY android-ndk-r21e /usr/local/android-ndk-r21e

# 环境变量
ENV PATH=$PATH:/usr/local/android-ndk-r21e/toolchains/llvm/prebuilt/linux-x86_64/bin
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.aite.xyz,direct
