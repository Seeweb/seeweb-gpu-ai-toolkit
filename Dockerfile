FROM ubuntu:22.04

WORKDIR /root/

ADD pip_requirements.txt .

RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive \
        apt-get install \
        --yes \
        --no-install-recommends \
        --option "Acquire::http::No-Cache=true" \
        --option "Acquire::http::Pipeline-Depth=0" \
        apt-utils


RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
	apt-get install \
	--yes \
	--no-install-recommends \
	--option "Acquire::http::No-Cache=true" \
	--option "Acquire::http::Pipeline-Depth=0" \
	python3 python3-pip git tmux screen vim htop valgrind build-essential


ENV PIP_ROOT_USER_ACTION=ignore

RUN pip install --upgrade pip

RUN pip3 install -r pip_requirements.txt
	
