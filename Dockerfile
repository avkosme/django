FROM avkosme/centos

RUN yum -y install gcc
RUN yum -y install zlib-devel
RUN yum -y install openssl-devel
RUN yum -y install libffi-devel
RUN yum -y install make
RUN yum -y install wget
RUN yum -y install python-devel mysql-devel sqlite-devel

RUN cd /opt/ && wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz -O /opt/Python-3.7.0.tar.xz
RUN tar xf /opt/Python-3.7.0.tar.xz -C /opt/
RUN cd /opt/Python-3.7.0 && ./configure
RUN cd /opt/Python-3.7.0 && make
RUN cd /opt/Python-3.7.0 && make install

RUN echo 'alias python=python3.7' >> ~/.bashrc

RUN curl https://bootstrap.pypa.io/get-pip.py -o /opt/get-pip.py
RUN python /opt/get-pip.py
RUN pip3.7 install --upgrade pip

ADD requirements.txt /opt/requirements.txt
RUN pip3.7 install -r /opt/requirements.txt