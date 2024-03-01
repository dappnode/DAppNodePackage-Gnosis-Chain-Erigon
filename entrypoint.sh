#!/bin/sh

DATADIR="/home/erigon-gnosis/.local/share"

##########
# Erigon #
##########

exec erigon --datadir=${DATADIR} \
    --chain=gnosis \
    --http.addr=0.0.0.0 \
    --http.port=8545 \
    --http.vhosts=* \
    --http.corsdomain=* \
    --ws \
    --private.api.addr=0.0.0.0:9090 \
    --internalcl \
    --lightclient.discovery.addr=0.0.0.0 \
    --lightclient.discovery.port=${CAPLIN_P2P_PORT} \
    --lightclient.discovery.tcpport=${CAPLIN_P2P_TCP_PORT} \
    --metrics \
    --caplin.backfilling=${CL_BACKFILLING} \
    --metrics.addr=0.0.0.0 \
    --metrics.port=6060 \
    --pprof \
    --pprof.addr=0.0.0.0 \
    --pprof.port=6061 \
    --port=${P2P_PORT} \
    --authrpc.jwtsecret=${JWT_PATH} \
    --authrpc.addr=0.0.0.0 \
    --authrpc.vhosts=* \
    --torrent.port=43084 \
    --torrent.upload.rate=16mb \
    --torrent.download.rate=32mb \
    ${EXTRA_OPTS}
