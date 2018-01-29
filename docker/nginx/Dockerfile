FROM gcorp/nginx:build 
COPY provision.yml /tmp/provision.yml
COPY vault/star.gahan-corporation.key /tmp/star.gahan-corporation.key
COPY files/bin/provision /usr/bin/provision
COPY files/etc/bureau /tmp/bureau
COPY vault/pass.keys /tmp/pass.keys 
RUN chmod -x /tmp/bureau 
CMD /usr/bin/provision
