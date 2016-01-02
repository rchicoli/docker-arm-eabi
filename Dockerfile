FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV ARCH arm
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/toolchains/arm-eabi-4.6/bin
ENV CROSS_COMPILE arm-eabi-

RUN  apt-get update && \
     apt-get install -y build-essential libqt4-dev libncurses5-dev \
       git wget vim && \
     rm -rf /var/lib/apt/lists/*

RUN  wget http://dn.odroid.com/ODROID-XU/compiler/arm-eabi-4.6.tar.gz && \
     mkdir /opt/toolchains && \
     tar zxvf arm-eabi-4.6.tar.gz -C /opt/toolchains && \
     rm -f arm-eabi-4.6.tar.gz

CMD ["/bin/bash"]
