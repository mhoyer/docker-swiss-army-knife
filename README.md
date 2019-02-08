# Swiss Army Knife

This repo contains a docker image for debugging running containers with sidecar approach. Its based on the brilliant article [Debugging Python Containers in Production](https://blog.0x74696d.com/posts/debugging-python-containers-in-production/) by 0x74696d (and [leodotcloud/swiss-army-knife](https://github.com/leodotcloud/swiss-army-knife))

## Running

Find the container `id` or `name` to debug:
```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"
CONTAINER_ID_OR_NAME=  # id or name to debug
```

Start the swiss army knife:
```bash
docker run -itd --name sak --rm \
    --net=container:${CONTAINER_ID_OR_NAME} \
    --pid=container:${CONTAINER_ID_OR_NAME} \
    --cap-add sys_admin \
    --cap-add sys_ptrace \
    mhoyer/swiss-army-knife
```

Open the debugging bash inside the swiss army knife sidecar:
```bash
docker exec sak bash
```

Now run all the fancy tools to debug process with (probably) `PID=1`.

Shut down the sidecar container:
```bash
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
