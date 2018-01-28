FROM nginx:alpine
RUN apk update
RUN apk add bash
COPY files/ssl/star.gahan-corporation.ca-bundle.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.ca.crt /etc/ssl/certs/
COPY files/ssl/star.gahan-corporation.crt /etc/ssl/certs/
