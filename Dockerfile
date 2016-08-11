FROM ubuntu:14.04.4
MAINTAINER Brian Muller <bamuller@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openvpn easy-rsa

VOLUME ["/etc/openvpn"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

#RUN mkdir /etc/openvpn/easy-rsa/
#RUN cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa/

#WORKDIR /etc/openvpn/easy-rsa
#ADD conf/ca-init.sh /etc/openvpn/easy-rsa
#RUN /etc/openvpn/easy-rsa/ca-init.sh
#RUN ls /etc/openvpn/easy-rsa/keys

EXPOSE 1194/udp

CMD ["echo", "hi"]
