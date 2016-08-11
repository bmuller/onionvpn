main: build
	docker run -it --rm vpntor

build:
	docker build -t onionvpn .

clean:
	docker rm onionvpn_data

datacontainer:
	docker run --name onionvpn_data -v /etc/openvpn ubuntu:14.04.4

init: build datacontainer
	docker run --volumes-from onionvpn_data --rm -it onionvpn ca-init.sh
