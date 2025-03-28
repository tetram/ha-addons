ARG VERSION=6.2.7.0
FROM mekayelanik/ispyagentdvr:$VERSION

ENV VERSION=$VERSION

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh && \
  apt update && \
  apt install -y jq curl && \
  apt clean

ENV CONFIG_PATH=/data/options.json

ENTRYPOINT ["/entrypoint.sh"]
