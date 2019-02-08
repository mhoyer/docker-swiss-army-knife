FROM ubuntu:18.04
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        apt-transport-https \
        arping \
        arptables \
        bridge-utils \
        ca-certificates \
        conntrack \
        curl \
        dnsutils \
        ethtool \
        gdb \
        iperf \
        iperf3 \
        iproute2 \
        ipsec-tools \
        ipset \
        iptables \
        iputils-ping \
        jq \
        kmod \
        ldap-utils \
        less \
        libpcap-dev \
        net-tools \
        netcat \
        netcat-openbsd \
        openssl \
        psmisc \
        python-dbg \
        python3-dbg \
        socat \
        software-properties-common \
        strace \
        tcpdump \
        telnet \
        tmux \
        tree \
        vim \
        wget && \
    rm -rf /var/lib/apt/lists/*

    # mv /usr/sbin/tcpdump /usr/bin/tcpdump && \
RUN curl -sL https://download.docker.com/linux/static/stable/x86_64/docker-18.06.1-ce.tgz > docker.tgz && \
    tar xzf docker.tgz docker && \
    mv docker /usr/bin/docker && \
    chmod +x /usr/bin/docker && \
    rm -rf docker.tgz

RUN curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.9.10/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.9 && \
    curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.10.5/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.10 && \
    curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.11.2/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.11 && \
    curl -sL https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl > /usr/local/bin/kubectl-1.13 && \
    chmod +x /usr/local/bin/kubectl* && \
    ln -s /usr/local/bin/kubectl-1.13 /usr/local/bin/kubectl && \
    mkdir /root/.kube

RUN echo "deb [trusted=yes] https://repo.iovisor.org/apt/bionic bionic-nightly main" | tee /etc/apt/sources.list.d/iovisor.list && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated bcc-tools && \
    rm -rf /var/lib/apt/lists/*
