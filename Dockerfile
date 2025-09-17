# First stage of Dockerfile
FROM alpine:latest

ENV PS2DEV /usr/local/ps2dev
ENV PATH   $PATH:${PS2DEV}/ee/bin

COPY . /src

RUN apk add build-base bash gcc git make flex bison texinfo gawk
RUN cd /src && ./toolchain.sh

# Second stage of Dockerfile
FROM alpine:latest

ENV PS2DEV /usr/local/ps2dev
ENV PATH   $PATH:${PS2DEV}/ee/bin

COPY --from=0 ${PS2DEV} ${PS2DEV}
