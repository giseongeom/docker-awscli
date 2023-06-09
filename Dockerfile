FROM ubuntu:22.04
LABEL maintainer="GiSeong Eom perfmon99@gmail.com"

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
        ca-certificates \
        curl \
        dos2unix \
        iproute2 \
        jq \
        net-tools \
        ssh-tools \
        unzip \
        vim-tiny \
        wget

COPY custom-scripts/*.sh /tmp/custom-scripts/
RUN bash /tmp/custom-scripts/install-curl.sh
RUN bash /tmp/custom-scripts/install-tcping.sh
RUN bash /tmp/custom-scripts/install-awscli.sh
RUN rm -rf /tmp/custom-scripts
