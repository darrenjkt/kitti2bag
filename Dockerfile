FROM ros:lunar-ros-base

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install \
    ros-lunar-cv-bridge \
    ros-lunar-opencv3 \
    ros-lunar-tf \
    python-pip \
    python-matplotlib \
  && rm -rf /var/lib/apt/lists/*
RUN pip install pandas==0.23
RUN pip install scipy==1.2.0

ADD . /kitti2bag
RUN pip install -e /kitti2bag

WORKDIR /data
RUN chmod +x /kitti2bag/docker_entrypoint.sh
ENTRYPOINT ["/kitti2bag/docker_entrypoint.sh"]

