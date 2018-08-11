FROM frolvlad/alpine-python2

RUN apk update --no-cache && apk upgrade --no-cache \
    && apk add --no-cache su-exec git 

RUN adduser -D -g '' garminbackup \
    && mkdir -p /home/garminbackup \
    && git clone https://github.com/JohannesHeinrich/garmin-connect-export.git /home/garminbackup \
    && mkdir -p /home/garminbackup/data \
    && chown -R garminbackup /home/garminbackup

ADD garminbackup_crontab /etc/periodic/15min/garminbackup
RUN chmod a+x /etc/periodic/15min/garminbackup 

CMD ["/usr/sbin/crond","-f"]
