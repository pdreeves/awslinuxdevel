FROM amazonlinux

LABEL version="2021.07.14"
LABEL maintainer="github.com/pdreeves"
LABEL description="A container I use for development work."

# Adding to rebuild

# Install base applications 
RUN amazon-linux-extras install epel  && \
  yum update -y && \
  yum install iputils wget curl python3 screen certbot jq openssh-clients sshpass telnet nc unzip zsh git bind-utils -y && \
  yum clean all && \
  rm -rf /var/cache/yum && \
  mkdir /root/.ssh && \
  echo "ServerAliveInterval 60" >> /root/.ssh/config && \
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python3 get-pip.py && \
  pip3 install awscli ansible boto3 requests ldap3 pre-commit splunk-sdk --upgrade && \
  pip install botocore

WORKDIR /root
RUN curl -o op_linux_amd64_v0.8.0.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.8.0/op_linux_amd64_v0.8.0.zip && \
	unzip op_linux_amd64_v0.8.0.zip && \
	mv op /usr/local/bin && \
	rm op*

# Volume for external code
VOLUME /opt/code

# Volume for ssh configs
VOLUME /root/.ssh

CMD zsh
