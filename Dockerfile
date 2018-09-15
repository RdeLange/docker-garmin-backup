FROM frolvlad/alpine-python2

LABEL description="A dockerized version of garmin-connect-export."
LABEL maintainer="Stynoo"

ENV PROJECT=garminbackup
ENV PROJECT_DIR=/home/$PROJECT

WORKDIR $PROJECT_DIR

RUN apk update --no-cache \
    && apk add --no-cache su-exec git \
    && git clone https://github.com/pe-st/garmin-connect-export.git $PROJECT_DIR \
    && mkdir -p $PROJECT_DIR/data

COPY garminbackup_crontab /etc/periodic/daily/garminbackup
RUN adduser -D -g '' $PROJECT \ 
    && chown -R $PROJECT $PROJECT_DIR \
    && chmod a+x /etc/periodic/daily/garminbackup

CMD ["/usr/sbin/crond","-f"]
