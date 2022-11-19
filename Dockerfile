FROM gazebo:libgazebo9-bionic

SHELL ["/bin/bash", "--login", "-c"]

RUN apt-get update && apt install gazebo9 libgazebo9-dev libjansson-dev libboost-dev imagemagick libtinyxml-dev mercurial cmake build-essential curl git -y


RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 8
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN cd ~; git clone https://github.com/osrf/gzweb

RUN cd ~/gzweb && git checkout gzweb_1.4

COPY ./entrypoint.sh /

EXPOSE 11345

EXPOSE 8080

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["bash"]
