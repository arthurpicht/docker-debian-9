FROM debian:9

ENV DOCKER_NAME="debian-9"
ENV LANG C.UTF-8

RUN set -eux; \
	export DEBIAN_FRONTEND=noninteractive; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		apt-utils; \
	apt-get -y upgrade; \
	apt-get install -y --no-install-recommends \
		procps \
		wget \
		tar \
		less \
		ca-certificates p11-kit; \
	rm -rf /var/lib/apt/lists/*; \
	echo "PS1='\[\033[01;33m\][\$DOCKER_NAME]\[\033[01;31m\]\u@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc; \
	echo "alias ls='ls --color=auto'" >> /root/.bashrc; \
	echo "alias ll='ls -alF'" >> /root/.bashrc; \
	echo "alias la='ls -A'" >> /root/.bashrc; \
	echo "alias l='ls -CF'" >> /root/.bashrc;

# see also: 
# https://github.com/docker-library/buildpack-deps/blob/1845b3f918f69b4c97912b0d4d68a5658458e84f/stretch/scm/Dockerfile
# https://github.com/docker-library/openjdk/blob/master/11/jdk/Dockerfile







