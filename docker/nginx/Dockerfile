FROM gcorp/nginx:build 
COPY provision.yml /tmp/provision.yml
COPY vault/star.gahan-corporation.key /tmp/star.gahan-corporation.key
ENV VAULT $VAULT
CMD /usr/bin/provision
