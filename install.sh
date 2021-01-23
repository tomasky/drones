
apk update
apk add --no-cache openjdk8
apk --no-cache add gc-dev musl-dev libc-dev build-base git
apk add libunwind-dev -U -X http://nl.alpinelinux.org/alpine/edge/main
git clone --depth=1 -b 2018-03-01 https://github.com/google/re2.git && \
    cd re2 && \
    CXX=clang++ make && \
    make install

export SBT_VERSION="1.4.6"
export SBT_HOME="/usr/local/sbt"
export PATH="${PATH}:${SBT_HOME}/bin"
mkdir -p ${SBT_HOME} && \
    apk add --no-cache bash wget bc && \
    wget "https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz" -O - \
      | tar xz -C ${SBT_HOME} --strip-components=1 && \
    sbt about

