ARG UPSTREAM_VERSION
FROM erigontech/erigon:${UPSTREAM_VERSION}

USER root

# Install curl
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

COPY /security /security

# Set up entrypoint script
COPY /erigon/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod u+x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
