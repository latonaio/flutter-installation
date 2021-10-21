#!/bin/bash

IMAGE_PREFIX=latonaio
IMAGE_NAME=flutter-devenv
CONTAINER_NAME=flutter-devenv

here=$(cd "$(dirname "$0")"; pwd)

# イメージが存在しない場合
if [ ! "$(docker images -qf "reference=$IMAGE_PREFIX/$IMAGE_NAME:latest")" ]; then
	bash "$here/docker-build.sh"
fi

# コンテナが存在しない場合
if [ ! "$(docker ps -aqf "name=$CONTAINER_NAME")" ]; then
	docker create -it --name "$CONTAINER_NAME" "$IMAGE_PREFIX/$IMAGE_NAME:latest" /bin/bash
fi

# コンテナが起動していない場合
if [ "$(
	docker ps -aqf status=exited -f "name=$CONTAINER_NAME"
	docker ps -aqf status=created -f "name=$CONTAINER_NAME"
)" ]; then
	docker start flutter-devenv 
fi

# シェルの起動
docker exec -it "$CONTAINER_NAME" bash
