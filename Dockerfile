FROM alpine

RUN apk update && apk add logrotate

COPY load-and-sleep.sh logrotate.conf run-logrotate.sh clean-completed-pods.sh /

ENTRYPOINT ["/load-and-sleep.sh"]