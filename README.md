# Swiss Army Knife

This repo contains a docker image for debugging running containers with sidecar approach. Its based on the brilliant article [Debugging Python Containers in Production](https://blog.0x74696d.com/posts/debugging-python-containers-in-production/) by 0x74696d (and [leodotcloud/swiss-army-knife](https://github.com/leodotcloud/swiss-army-knife))

## Running

Find the container `id` or `name` to debug:
```
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"
export CONTAINER_ID_OR_NAME_TO_DEBUG=xxx
```

Start the swiss army knife:
```
docker run -n sak --rm --net=container:${CONTAINER_ID_OR_NAME_TO_DEBUG} --pid=container:${CONTAINER_ID_OR_NAME_TO_DEBUG} -itd mhoyer/swiss-army-knife
```

Open the debugging bash inside the swiss army knife sidecar:
```
docker exec sak bash
# run all the fancy tools to debug process with PID=1
```

Shut down the sidecar container:
```
docker stop sak
```

## Tools in the box

- apt-transport-https
- arping
- arptables
- [bcc-tools](https://github.com/iovisor/bcc)
- bridge-utils
- ca-certificates
- conntrack
- curl
- dnsutils
- docker
- ethtool
- gdb
- iperf
- iperf3
- iproute2
- ipsec-tools
- ipset
- iptables
- iputils-ping
- jq
- kmod
- kubectl
- ldap-utils
- less
- libpcap-dev
- net-tools
- netcat
- netcat-openbsd
- openssl
- psmisc
- python-dbg
- python3-dbg
- socat
- software-properties-common
- strace
- tcpdump
- telnet
- tmux
- tree
- vim
- wget
