FROM centos:7

#USER root

RUN yum update -y
RUN yum install -y epel-release
RUN yum install nginx -y
RUN yum install httpd -y
RUN yum install  -y gcc openssl-devel bzip2-devel libffi-devel
RUN yum -y groupinstall development
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install make

RUN yum install wget -y

RUN wget -P /src/python37/ https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
RUN tar xzf /src/python37/Python-3.7.3.tgz -C /src/python37

#RUN /src/python37/Python-3.7.3/configure --enable-shared --prefix=/opt/python LDFLAGS=-Wl,-rpath=/opt/python/lib
RUN /src/python37/Python-3.7.3/configure --enable-shared --prefix=/usr/local LDFLAGS="-Wl,-rpath /usr/local/lib"
#RUN make altinstall
RUN make install


#RUN /opt/python/bin/python3.7 -V
#RUN /opt/python/bin/python3.7 -m pip install pyinstaller

RUN pip3 install pyinstaller requests cryptography


#RUN /opt/python/bin/python3.7 -m pip install requests
#RUN /opt/python/bin/python3.7 -m pip install cryptography
#RUN /o

CMD ["/bin/sh"]

