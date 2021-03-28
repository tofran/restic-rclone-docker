#!/bin/bash

function get_tags()
{
    curl "https://hub.docker.com/v2/repositories/$1/tags?page_size=6&page=1" \
    | jq -r '.results[].name'
} 

restic_tags=$(get_tags "restic/restic" | tac)
rclone_tags=$(get_tags "rclone/rclone" | tac)

for restic_tag in $restic_tags; do
    for rclone_tag in $rclone_tags; do
        image_name="tofran/restic-rclone:${restic_tag}_${rclone_tag}"

        echo "Building ${image_name}"
        docker build \
            --build-arg "RESTIC_TAG=${restic_tag}" \
            --build-arg "RCLONE_TAG=${rclone_tag}" \
            --cache-from "${image_name}" \
            --tag "${image_name}" \
            .

        echo "Pushing ${image_name}"
        docker push "${image_name}"
    done
done