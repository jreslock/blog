FROM ubuntu:18.04
ADD entrypoint.sh /entrypoint.sh
RUN addgroup --gid 1001 blog && \
    adduser --uid 1001 --gid 1001 --shell /bin/bash --disabled-password --gecos 'blog' blog && \
    apt-get update -qq -y && \
    apt-get install -qq -y wget python3-pip && \
    wget https://github.com/gohugoio/hugo/releases/download/v0.54.0/hugo_0.54.0_Linux-64bit.deb && \
    dpkg -i hugo_0.54.0_Linux-64bit.deb && \
    apt-get -qq clean && \
    apt-get -qq autoremove --purge && \
    chmod +x /entrypoint.sh
EXPOSE 1313
USER blog
RUN pip3 install -q --no-cache-dir --user pygments
ENTRYPOINT ["/entrypoint.sh"]