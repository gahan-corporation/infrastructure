FROM nginx:alpine
RUN apk update
RUN apk add bash
COPY files/ssl/star.gahan-corporation.ca-bundle.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.ca.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.crt /etc/ssl/certs/
ARG VAULT
ENV VAULT $VAULT
RUN mkdir -p /etc/ansible; apk add python3 wget; wget https://bootstrap.pypa.io/get-pip.py; ln -sf /usr/bin/python3 /usr/bin/python; python get-pip.py; rm get-pip.py
RUN pip install ansible;
