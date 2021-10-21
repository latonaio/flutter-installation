# syntax = docker/dockerfile:1.0.0-experimental

FROM ubuntu:focal

RUN apt-get update && apt-get upgrade -y

# flutter prerequisites
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	bash \
	curl \
	file \
	git \
	unzip \
	xz-utils \
	zip \
	libglu1-mesa

# flutter linux prerequisites
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	clang \
	cmake \
	ninja-build \
	pkg-config \
	libgtk-3-dev

RUN groupadd --system --gid 1000 flutter
RUN useradd --system --create-home --uid 1000 --gid flutter flutter
USER flutter:flutter

WORKDIR /home/flutter

RUN git clone https://github.com/flutter/flutter.git -b stable flutter-sdk

RUN flutter-sdk/bin/flutter precache --linux
RUN flutter-sdk/bin/flutter config --no-analytics --no-enable-web --enable-linux-desktop

ENV PATH="$PATH:/home/flutter/flutter-sdk/bin"
ENV PATH="$PATH:/home/flutter/flutter-sdk/bin/cache/dart-sdk/bin"
