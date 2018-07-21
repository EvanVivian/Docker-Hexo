FROM ubuntu
MAINTAINER Evan yanweichao021@gmail.com
WORKDIR /Hexo
RUN apt-get update && apt-get upgrade -y && apt-get install -y vim git nodejs npm\
    && apt-get clean  && rm -rf /var/lib/apt/lists/*  \
    && npm install -g hexo && hexo init /Hexo && npm install && npm install hexo-deployer-git --save \
    && mkdir -p /root/.ssh/ && git config --global user.email "you-email" && git config --global user.name "you-name" \
    && git clone https://github.com/luuman/hexo-theme-spfk.git themes/spfk
VOLUME ["/Hexo/source"]
EXPOSE 4000
CMD ["/bin/bash"]
