FROM amazonlinux

# Install and configure base applications 
RUN amazon-linux-extras install epel  && \
  yum update -y && \
  yum install python3 screen certbot jq openssh-clients sshpass telnet nc unzip -y && \
  yum clean all && \
  rm -rf /var/cache/yum

# Intall pip, awscli, and ansible
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py && \
  pip3 install awscli ansible boto3 --upgrade

# Install op
WORKDIR /root
RUN curl -o op_linux_amd64_v0.5.5.zip https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_linux_amd64_v0.5.5.zip && \
	unzip op_linux_amd64_v0.5.5.zip && \
	mv op /usr/local/bin


# Volume for persistant storage or bind mounts
VOLUME /opt/external
