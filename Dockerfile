FROM ubuntu:22.04
ENV PASSWORD="password"
CMD ["/bin/sh", "-c", "su - labs"]

COPY ./solutions /root/
RUN set -ex; \
    \
    apt-get update; \
    apt-get install -y python2 python-pip file python3 language-pack-en gdb valgrind zsh git bash ruby wget curl tmux gcc neovim vim make clang sudo gcc-multilib; \
    useradd -m labs; \
    useradd -m admin; \
    usermod -aG sudo admin; \
    update-locale LANG=en_US.UTF-8 LC_MESSAGES=POSIX; \
    chsh -s $(which zsh) labs; \
    echo "labs:${PASSWORD}" | chpasswd; \
    echo "admin:${PASSWORD}" | chpasswd 

COPY ./src/ /home/labs/
RUN (cd /home/labs/week1 && make)
RUN (cd /home/labs/week2 && make)
RUN (cd /home/labs/week3 && make)
RUN (cd /home/labs/week4 && make)
RUN (cd /home/labs/week5 && make)
RUN (cd /home/labs/week6 && make)
RUN (cd /home/labs/week7 && make)
RUN chown -R labs:labs /home/labs
RUN (cd /home/labs/week1/challenges && python2 install.py)
RUN (cd /home/labs/week2/challenges && python2 install.py)
RUN (cd /home/labs/week3/challenges && python2 install.py)
RUN (cd /home/labs/week4/challenges && python2 install.py)
RUN (cd /home/labs/week5/challenges && python2 install.py)
RUN (cd /home/labs/week6/challenges && python2 install.py)
RUN (cd /home/labs/week7/challenges && python2 install.py)

USER labs
WORKDIR /home/labs
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
RUN git clone https://github.com/blue9057/config.git
RUN mv config/* .
RUN mv zshrc .zshrc && mv bashrc .bashrc && mv zprofile .zprofile && mv gitconfig .gitconfig && mv irbrc .irbrc && mv vimrc .vimrc && mv vim .vim
RUN rm -rf ssh
RUN rm -rf config
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN pip2 install pwntools
RUN mkdir .config
RUN mkdir .config/nvim
RUN (cd .config/nvim && wget https://gist.githubusercontent.com/gnubufferoverflows/14f77f713f20fe0197b31d81c9511e92/raw/c8d9fab0f7f6c7dd649b7a1b390f0925a2506e43/init.lua)
