FROM postgres:alpine
USER postgres
RUN initdb -D /var/lib/postgresql/data
RUN createuser -s duchess
