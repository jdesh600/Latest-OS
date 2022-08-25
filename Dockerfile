FROM ubuntu:latest

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
# wget for downloading files (especially in tests, which run in this environment)
		ca-certificates \
		wget \
# git for cloning source code
		git \
# gawk for diff-pr.sh
		gawk \
# tar -tf in diff-pr.sh
		bzip2 \
	; \
	rm -rf /var/lib/apt/lists/*

ENV DIR /usr/src/official-images
ENV BASHBREW_LIBRARY $DIR/library

WORKDIR $DIR
COPY . $DIR
