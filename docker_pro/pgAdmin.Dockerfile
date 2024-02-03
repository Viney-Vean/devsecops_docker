# Use an official NGINX base image
FROM dpage/pgadmin4

LABEL maintainer="Viney Vean <viney.vean@gmail.com>"

ENV PGADMIN_DEFAULT_EMAIL=admin@admin.com
ENV PGADMIN_DEFAULT_PASSWORD=admin
ENV PGADMIN_LISTEN_PORT=80
