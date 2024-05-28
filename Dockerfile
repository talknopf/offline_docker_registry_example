FROM registry:2

ENV REGISTRY_AUTH="htpasswd"
ENV REGISTRY_AUTH_HTPASSWD_REALM="Registry Realm"
ENV REGISTRY_AUTH_HTPASSWD_PATH="/auth/htpasswd"

RUN apk add --no-cache apache2-utils \
    && mkdir -p /auth \
    && htpasswd -Bbn myuser mypassword > /auth/htpasswd

COPY config.yml /etc/docker/registry/config.yml

EXPOSE 5000
CMD ["registry", "serve", "/etc/docker/registry/config.yml"]
