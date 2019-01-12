FROM amazonlinux

# Install EPEL, python3, screen and Let's Encrypt Cert Bot
RUN amazon-linux-extras install epel  && \
  yum update -y && \
  yum install python3 screen certbot jq awscli ansible -y && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py && \
  pip3 install boto3 --upgrade

# Volume for persistant storage or bind mounts
VOLUME /opt/external
