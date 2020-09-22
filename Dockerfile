# 基础镜像
FROM golang:buster

# 作者信息
LABEL MAINTAINER="xiaoqidun@gmail.com"

# 安装工具
RUN apt-get update \
    && apt-get install -y \
    unzip
