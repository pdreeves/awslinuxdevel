FROM amazonlinux

# Install EPEL, python3, screen and Let's Encrypt Cert Bot
RUN amazon-linux-extras install epel  && \
  yum update -y && \
  yum install python3 screen certbot jq openssh-clients sshpass -y && \
  yum clean all && \
  rm -rf /var/cache/yum

# Intall pip, awscli, and ansible
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py && \
  pip3 install awscli ansible boto3 --upgrade

# Volume for persistant storage or bind mounts
VOLUME /opt/external
