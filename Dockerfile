FROM nvidia/cudagl:10.2-devel-ubuntu18.04
FROM ros:melodic-ros-core-bionic
MAINTAINER Leonardo Edgar

# Install core linux tools
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-utils lsb-release sudo unzip wget ssh vim curl\
	&& rm -rf /var/lib/apt/lists/* 

# Install Python
RUN apt-get update && \
	apt-get install -y ipython \
	python-dev python-numpy python-pip \
	python-scipy python-pytest python-opencv \
	python-serial python-pytest-mock python-ipdb

# Install python-catkin-tools
RUN apt-get update && apt-get install -y python-catkin-tools\
	&& rm -rf /var/lib/apt/lists/*

# Install source code
RUN ./update-sourcode.sh
