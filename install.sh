#!/bin/sh
 
 yum update -y
 yum install -y wget git
 #wget "http://www.haproxy.org/download/1.5/src/haproxy-1.5.6.tar.gz"
wget "http://www.haproxy.org/download/1.5/src/haproxy-1.5.9.tar.gz"
 yum groupinstall -y 'Development Tools'
 yum install -y openssl-devel
 yum install -y rpmdevtools pcre-devel
 rpmdev-setuptree 
 mv haproxy-1.5.9.tar.gz ~/rpmbuild/SOURCES/
git clone https://github.com/vikramnc/haproxy
 cp haproxy/haproxy-amzn/conf/* ~/rpmbuild/SOURCES/
 cp haproxy/haproxy-amzn/spec/* ~/rpmbuild/SPECS/
 cd rpmbuild/
 rpmbuild -ba ~/rpmbuild/SPECS/haproxy.spec
 rpm -Uvh ~/rpmbuild/RPMS/x86_64/haproxy-1.5.9-1.amzn1.x86_64.rpm
 cp -r ~/haproxy/haproxy-amzn/conf/ssl /etc/haproxy/
 # vi /etc/haproxy/haproxy.cfg 
 # chkconfig haproxy on
