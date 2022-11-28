FROM ghcr.io/hyperk/hk-pilot:main

RUN --mount=type=ssh mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

COPY . /usr/local/hk/hk-meta-externals

WORKDIR /usr/local/hk
RUN --mount=type=ssh . /usr/local/hk/hk-pilot/setup.sh &&\
    hkp install -r hk-meta-externals -vvv
