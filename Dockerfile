FROM matrixdotorg/synapse:v1.12.0

RUN apk add --no-cache git &&\
  pip install boto3 git+https://github.com/matrix-org/synapse-s3-storage-provider.git@a38b15b2a8588d734ebd43b9471aa9d6278feeb4

VOLUME ["/data"]

EXPOSE 8008/tcp 8009/tcp 8448/tcp

ENTRYPOINT ["/start.py"]
