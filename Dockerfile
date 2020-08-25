From osrf/ros:melodic-desktop-full
From tensorflow/tensorflow:1.15.0-gpu-py3

MAINTAINER Kochi Nakajima
RUN apt update && apt install -y \
        software-properties-common \
        openssh-client \
        openssh-server \
        net-tools \
        x11-utils \
        pkg-config \
        python-pip \
        python3-pip \
        unzip \
        libgl-dev \
        wget \
        libssl1.0-dev \
        nodejs-dev \
        node-gyp \
        npm

        # Included in ros image, so no need to install explicitly
        # git \
        # libegl1-mesa-dev \
        # libglu1-mesa-dev \
        # build-essential \
        # libxmu-dev \
        # libxi-dev \
        # cmake \
        # libgtk2.0-dev \
        # curl \
# RUN apt update && apt install -y \
#         libboost1.65-dev

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \ 
        apt-get install -y nodejs        

RUN npm i -g yarn
WORKDIR /root
RUN mkdir libs
# Good until here as of 20200731 : setup for gui

# # Basler Setup
# WORKDIR /root/libs
# RUN wget https://www.baslerweb.com/fp-1551786516/media/downloads/software/pylon_software/pylon-5.2.0.13457-x86_64.tar.gz
# RUN tar xvf pylon-5.2.0.13457-x86_64.tar.gz
# WORKDIR /root/libs/pylon-5.2.0.13457-x86_64
# RUN tar -C /opt -xzf pylonSDK-5.2.0.13457-x86_64.tar.gz
# ENV LD_LIBRARY_PATH /opt/pylon5/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# # OpenCV setup
# WORKDIR /root/libs
# RUN wget https://github.com/opencv/opencv/archive/4.2.0.zip
# RUN unzip 4.2.0.zip
# WORKDIR /root/libs/opencv-4.2.0
# RUN mkdir build
# WORKDIR /root/libs/opencv-4.2.0/build
# RUN cmake ..
# RUN make -j4
# RUN make install
# RUN ldconfig

# # OpenGL setup
# WORKDIR /root/libs
# RUN git clone https://github.com/nigels-com/glew.git glew

# # Alternatively
# RUN wget https://sourceforge.net/projects/glew/filew/glew/2.1.0/glew-2.1.0.zip
# RUN unzip glew-2.1.0.zip -d glew

# WORKDIR /root/libs/glew/auto
# RUN make SYSTEM=linux-egl

# WORKDIR /root/libs/glew/build
# RUN cmake ./cmake
# RUN make GLEW_DEST=/usr/local install

# WORKDIR /root/libs
# RUN wget https://github.com/glfw/glfw/releases/download/3.3.2/glfw-3.3.2.zip
# RUN unzip glfw-3.3.2.zip
# WORKDIR /root/libs/glfw-3.3.2
# RUN mkdir build
# WORKDIR /root/libs/glfw-3.3.2/build
# RUN cmake ..
# RUN make install

# # TODO: Defect Classification Setup
COPY automatedmetalpartpolishing /root/automatedmetalpartpolishing
COPY gpu_test.py /root/gpu_test.py

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_VISIBLE_CAPABILITIES \
    ${NVIDIA_VISIBLE_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

WORKDIR /root/automatedmetalpartpolishing/defect_classification
# RUN pip3 install -r requirements.txt

# # TODO: GPU Driver setup
# WORKDIR /root/libs
# RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
# RUN dpkg -i ./nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
# ADD libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb /root/libs
# RUN apt install -y ./libcudnn7-dev_7.6.5.32-1+cuda10.2_amd64.deb

# TODO: GUI Setup

# TODO: ROS Setup
ENV ROS_MASTER_URI=http://master:11311

