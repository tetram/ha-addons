ARG MD_VERSION=2.2.1
FROM maildev/maildev:$MD_VERSION

USER root

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh && \
  apk add --no-cache jq curl

USER node

ENV CONFIG_PATH=/data/options.json

ENTRYPOINT ["/entrypoint.sh"]
