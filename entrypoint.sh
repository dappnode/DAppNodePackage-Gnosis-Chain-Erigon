#!/bin/sh

case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_GNOSIS" in
"gnosis-beacon-chain-prysm.dnp.dappnode.eth")
    echo "Using gnosis-beacon-chain-prysm.dnp.dappnode.eth"
    JWT_PATH="/security/prysm/jwtsecret.hex"
    ;;
"lighthouse-gnosis.dnp.dappnode.eth")
    echo "Using lighthouse-gnosis.dnp.dappnode.eth"
    JWT_PATH="/security/lighthouse/jwtsecret.hex"
    ;;
"nimbus-gnosis.dnp.dappnode.eth")
    echo "Using nimbus-gnosis.dnp.dappnode.eth"
    JWT_PATH="/security/nimbus/jwtsecret.hex"
    ;;
"teku-gnosis.dnp.dappnode.eth")
    echo "Using teku-gnosis.dnp.dappnode.eth"
    JWT_PATH="/security/teku/jwtsecret.hex"
    ;;
"lodestar-gnosis.dnp.dappnode.eth")
    echo "Using lodestar-gnosis.dnp.dappnode.eth"
    JWT_PATH="/security/lodestar/jwtsecret.hex"
    ;;
*)
    echo "Using default"
    JWT_PATH="/security/default/jwtsecret.hex"
    ;;
esac

# Print the jwt to the dappmanager
JWT=$(cat $JWT_PATH)
curl -X POST "http://my.dappnode/data-send?key=jwt&data=${JWT}"


##########
# Erigon #
##########

exec erigon --datadir=${DATADIR} \
    --chain=gnosis \
    --http
    --http.addr=0.0.0.0 \
    --http.vhosts=* \
    --http.corsdomain=* \
    --ws \
    --private.api.addr=0.0.0.0:9090 \
    --externalcl \
    --metrics \
    --metrics.addr=0.0.0.0 \
    --metrics.port=6060 \
    --pprof \
    --pprof.addr=0.0.0.0 \
    --pprof.port=6061 \
    --port=${P2P_PORT} \
    --authrpc.jwtsecret=${JWT_PATH} \
    --authrpc.addr=0.0.0.0 \
    --authrpc.vhosts=* \
    ${EXTRA_OPTs}
