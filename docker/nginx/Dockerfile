FROM nginx:alpine
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.4/main' >> /etc/apk/repositories
RUN apk del --no-cache curl git libcurl libssh python3 wget bash python3 python3-dev openssl;
RUN apk update
RUN apk add --no-cache libssh2 libcurl curl git python3 bash wget python3 python3-dev openssl build-base libffi libffi-dev openssl-dev;
RUN ln -sf /usr/bin/python3 /usr/bin/python
COPY files/ssl/star.gahan-corporation.ca-bundle.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.ca.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.crt /etc/ssl/certs/
ARG VAULT
ENV VAULT $VAULT
RUN mkdir -p /etc/ansible
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN /usr/bin/python3 get-pip.py
RUN rm get-pip.py
RUN pip install ansible
RUN ansible -m lineinfile -a 'dest=/etc/ansible/hosts line="localhost ansible_connection=local" create=yes state=present' localhost
COPY files/ssl/private/star.gahan-corporation.key /etc/ssl/private/star.gahan-corporation.vault
COPY files/ssl/private/pass.keys /etc/ssl/private/pass.keys
