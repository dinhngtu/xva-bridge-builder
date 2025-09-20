FROM ghcr.io/xcp-ng/xcp-ng-build-env:8.3

RUN yum install -y python3-devel libarchive libarchive-devel
COPY requirements.txt .
RUN python3 -m venv /root/venv && \
    /root/venv/bin/python3 -m pip install -r requirements.txt
RUN mkdir -p /root/build
WORKDIR /root/build
COPY xva_bridge.py my.nuitka-package.config.yml do_build.sh .
RUN sh ./do_build.sh
