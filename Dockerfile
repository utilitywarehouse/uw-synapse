FROM matrixdotorg/synapse:v1.25.0

RUN apt update &&\
  apt install -y git cron rsyslog &&\
  pip install boto3 git+https://github.com/matrix-org/synapse-s3-storage-provider.git
  echo '0 0 * * * root find /tmp/media -type f -mtime +31 -exec rm {} \;' >/etc/cron.d/clear_media

VOLUME ["/data"]

EXPOSE 8008/tcp 8009/tcp 8448/tcp

ENTRYPOINT ["/start.py"]
