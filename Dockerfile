FROM alpine

RUN apk update && apk add logrotate

COPY load-and-sleep.sh /load-and-sleep.sh
COPY logrotate.conf /logrotate.conf
COPY run-logrotate.sh /run-logrotate.sh
COPY clean-completed-pods.sh /clean-completed-pods.sh

ENTRYPOINT ["/load-and-sleep.sh"]