FROM ubuntu:20.04

# Get neovim
RUN apt update && \
    apt install -y software-properties-common curl && \
    add-apt-repository -y  ppa:neovim-ppa/unstable && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt update && \
    apt install -y neovim python3 python3-pip git nodejs


RUN apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy the files
COPY .  /root/dotfiles

RUN bash

