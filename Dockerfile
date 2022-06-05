FROM ubuntu

LABEL version="2022.06.05"
LABEL maintainer="github.com/pdreeves"
LABEL description="A container I use for command line work."


RUN apt-get update && \
  apt-get upgrade -y && \
  DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata && \
  apt-get install inetutils-traceroute wget curl python3 jq netcat zsh git dnsutils python3-pip awscli ansible python3-boto3 python3-requests sshpash -y && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives && \
  echo "ServerAliveInterval 60" >> /root/.ssh/config && \
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

WORKDIR /root

# Volume for external code
VOLUME /opt/code

# Volume for ssh configs
VOLUME /root/.ssh

CMD zsh