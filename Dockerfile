FROM ubuntu:14.04
MAINTAINER Yu-Cheng (Henry) Huang

RUN apt-get update && \
    apt-get install -y man vim tmux git curl wget python-pip python-dev \
        build-essential ipython ctags ack-grep && \
    pip install --upgrade pip && \
	git clone https://github.com/Happyholic1203/dotfiles && \
	cd dotfiles && \
	git checkout -b vim origin/vim && \
	chmod +x ./install.sh && \
	./install.sh && \
	echo "#!/bin/bash" >> ~/init && \
	echo "TERM=xterm-256color tmux" >> ~/init && \
	echo "bash" >> ~/init && \
	chmod +x ~/init

CMD ["/root/init"]
