#!/usr/bin/env bash

set -euo pipefail

function get_tags() {
    curl -s "https://hub.docker.com/v2/repositories/$1/tags?page_size=6&page=1" \
    | jq -r '.results[].name'
} 

restic_tags=$(get_tags "restic/restic" | tac)
rclone_tags=$(get_tags "rclone/rclone" | tac)

for restic_tag in $restic_tags; do
    for rclone_tag in $rclone_tags; do
        tag="${restic_tag}_${rclone_tag}"
        dockerhub_image="tofran/restic-rclone:${tag}"
        github_image="ghcr.io/tofran/restic-rclone:${tag}"

        docker pull "$dockerhub_image" || true

        echo -e "\nBuilding $dockerhub_image"
        docker build \
            --build-arg "RESTIC_TAG=${restic_tag}" \
            --build-arg "RCLONE_TAG=${rclone_tag}" \
            --cache-from "$dockerhub_image" \
            --tag "$dockerhub_image" \
            .

        docker tag "$dockerhub_image" "$github_image"

        echo -e "\nPushing $dockerhub_image and $github_image"
        docker push "$dockerhub_image"
        docker push "$github_image"
    done
done