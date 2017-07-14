FROM nginx:alpine

ENV TAG_VERSION 0.0.1
ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' \
    FORWARD_PORT=80 \
    FORWARD_HOST=web \
    HEALTHCHECK_PATH=/health

WORKDIR /opt

RUN apk add --no-cache gettext

COPY auth.conf auth.htpasswd launch.sh ./

CMD ["./launch.sh"]
