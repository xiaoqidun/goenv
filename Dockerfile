# 基础镜像
FROM golang:1.20.3-bullseye

# 作者信息
LABEL MAINTAINER="xiaoqidun@gmail.com"

# 安装编译工具链
RUN apt-get update \
    && apt-get install -y \
    build-essential mingw-w64 \
    iproute2 upx-ucl file zip

# 安装android ndk
COPY android-ndk-r25c /usr/local/android-ndk-r25c

# 环境变量
ENV PATH=$PATH:/usr/local/android-ndk-r25c/toolchains/llvm/prebuilt/linux-x86_64/bin
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.aite.xyz,direct
