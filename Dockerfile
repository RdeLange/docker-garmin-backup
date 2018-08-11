FROM alpine:latest

# Run `docker build --no-cache .` to update dependencies
RUN apk update --no-cache \
    && apk add --no-cache python su-exec git
	
RUN adduser -D -g '' garminbackup \
    && mkdir -p /home/garminbackup \
    && git clone https://github.com/JohannesHeinrich/garmin-connect-export.git /home/garminbackup \
    && mkdir -p /home/garminbackup/data \
    && chown -R garminbackup /home/garminbackup

ADD garminbackup_crontab /etc/periodic/daily/garminbackup
RUN chmod a+x /etc/periodic/daily/garminbackup

CMD ["/usr/sbin/crond","-f"]
