FROM alpine

RUN apk update && apk add logrotate

COPY load-and-sleep.sh logrotate.conf run-logrotate /

RUN chmod 644 logrotate.conf

ENTRYPOINT ["/load-and-sleep.sh"]
