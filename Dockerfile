FROM amazonlinux

# Install EPEL, python3, screen and Let's Encrypt Cert Bot
RUN yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  yum update -y && \
  yum install python3 screen certbot -y

# Intall pip, awscli, and ansible
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
  python get-pip.py && \
  pip install awscli ansible --upgrade

# Volume for persistant storage or bind mounts
VOLUME /opt/external
