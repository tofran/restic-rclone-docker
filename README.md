# restic-rclone docker images

[![Automatic builds badge](https://github.com/tofran/restic-rclone-docker/actions/workflows/trigger-build.yaml/badge.svg)](https://github.com/tofran/restic-rclone-docker/actions/workflows/trigger-build.yaml)
[![Docker image size](https://img.shields.io/docker/image-size/tofran/restic-rclone?sort=date)][DockerHub]
[![Docker pulls](https://img.shields.io/docker/pulls/tofran/restic-rclone)][DockerHub]

Always up-to-date minimal Alpine multi-arch images, with **Restic** and **Rclone** tagged for each version combination.

[tofran/restic-rclone @ Docker Hub][DockerHub]

[tofran/restic-rclone @ GitHub container registry][GHCR]


## Tags

Images are tagged with a combination of Restic and Rclone tags, in the format: `{RESTIC_TAG}_{RCLONE_TAG}`.

Example tags: `latest_latest`, `0.15.1_1.54.1`, `latest_1.54`.

The latest 4 images from both upstreams are maintained. Image building is automatic, via [GitHub actions](https://github.com/tofran/restic-rclone-docker/actions).

## Usage

```sh
# Optionally, first pull the image from your favourite registry:
$ docker pull tofran/restic-rclone:0.15.1_1.61.1
#  or
$ docker pull ghcr.io/tofran/restic-rclone:0.15.1_1.61.1

# Run it:
$ docker run tofran/restic-rclone:0.15.1_1.61.1 -v
#  or
$ docker run ghcr.io/tofran/restic-rclone:0.15.1_1.61.1 -v
restic 0.15.1 compiled with go1.19.5 on linux/amd64
```

`restic` is the default entrypoint.

[DockerHub]: https://hub.docker.com/r/tofran/restic-rclone
[GHCR]: https://github.com/tofran/restic-rclone-docker/pkgs/container/restic-rclone
