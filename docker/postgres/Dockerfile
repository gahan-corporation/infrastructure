FROM postgres:alpine
# Special thanks to: https://hub.docker.com/r/tribalnova/alpine/~/dockerfile/
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8
RUN apk add --update --no-cache socat curl tzdata findutils
RUN ln -fs /usr/share/zoneinfo/GMT /etc/localtime
USER postgres
RUN initdb -D /var/lib/postgresql/data
