FROM ubuntu:kinetic-20220830

RUN apt update -y && apt install openssh-server nano sudo -y && service ssh start

RUN useradd -m foo && echo "foo:foo" | chpasswd && adduser foo sudo
RUN echo "foo     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER foo

WORKDIR /home/foo/.ssh

COPY authorized_keys /home/foo/.ssh/

WORKDIR /workspace

CMD sudo service ssh start && /bin/bash
