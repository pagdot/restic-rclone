FROM lsiobase/alpine:3.11 AS downloader

RUN apk --no-cache add wget unzip

ARG RCLONE_VERSION=1.55.1

RUN wget https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip && \
   unzip rclone-v${RCLONE_VERSION}-linux-amd64.zip && \
   mv rclone-v${RCLONE_VERSION}-linux-amd64/rclone /rclone

ARG RESTIC_VERSION=0.12.0
RUN wget https://github.com/restic/restic/releases/download/v${RESTIC_VERSION}/restic_${RESTIC_VERSION}_linux_amd64.bz2 && \
   bzip2 -d restic_${RESTIC_VERSION}_linux_amd64.bz2 && \
   mv restic_${RESTIC_VERSION}_linux_amd64 /restic && \
   chmod +x /restic

RUN RCLONE_VERSION=true /rclone version && \
   /restic version

# Begin final image
FROM lsiobase/alpine:3.11

RUN apk --no-cache add dcron curl && \
   ln -s /config/crontab /etc/crontabs/abc

ENV RCLONE_CONFIG=/tmp/rclone.conf
ENV RCLONE_CACHE_DIR=/cache

COPY --from=downloader /rclone /usr/local/bin/
COPY --from=downloader /restic /usr/local/bin/
COPY root/ /

VOLUME /config

WORKDIR /data
