ARG arch
FROM alpine AS resticfetch

RUN apk add --no-cache wget bzip2

ARG resticarch
RUN wget https://github.com/restic/restic/releases/download/v0.9.3/restic_0.9.3_linux_${resticarch}.bz2
RUN bzip2 -d restic_0.9.3_linux_${resticarch}.bz2
RUN mv restic_0.9.3_linux_${resticarch} restic
RUN chmod +x /restic

ARG arch
FROM multiarch/alpine:${arch}-edge

RUN apk add --no-cache mysql-client gzip ca-certificates

COPY --from=resticfetch /restic /usr/bin/restic
COPY ./run.sh /opt/backup/run.sh
RUN chmod +x /opt/backup/run.sh

CMD /opt/backup/run.sh