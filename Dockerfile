FROM clearlinux:latest
MAINTAINER fuyongjie@neusoft.com

ARG swupd_args

COPY setup.py /usr/bin/setup.py

# Update and add bundles
RUN swupd verify  --fix --force --picky -m 28100 && \
    swupd bundle-add os-clr-on-clr  software-defined-cockpit-dev $swupd_args && \
    pip3 install kconfiglib && \
    chmod 755 /usr/bin/setup.py

ENTRYPOINT ["/usr/bin/setup.py"]
