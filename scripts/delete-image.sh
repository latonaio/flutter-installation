#!/bin/bash

IMAGE_PREFIX=latonaio
IMAGE_NAME=flutter-devenv
CONTAINER_NAME=flutter-devenv

# コンテナが起動している場合
if [ "$(docker ps -qf "name=$CONTAINER_NAME")" ]; then
	docker stop "$CONTAINER_NAME"
fi

# コンテナが存在する場合
if [ "$(docker ps -aqf "name=$CONTAINER_NAME")" ]; then
	docker rm "$CONTAINER_NAME"
fi

(
	docker images -qf "reference=$IMAGE_NAME" --format '{{.Repository}}:{{.Tag}}'
	docker images -qf "reference=$IMAGE_PREFIX/$IMAGE_NAME" --format '{{.Repository}}:{{.Tag}}'
) | while IFS= read -r image; do
	docker rmi "$image"
done
