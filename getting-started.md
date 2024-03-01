# Erigon Gnosis Chain (Execution Client)

Welcome to the Merge Ready Erigon Gnosis Chain Execution Layer Client

There are now two RPC APIs in Execution Clients:

1. Querying API `http://erigon-gnosis.dappnode:8545`. Use this endpoint to query transactions on your node and connect to it with your web3 wallet.
2. The Beacon API is available in this package when it's stable upstreeam at `http://erigon-gnosis.dappnode:3500` -- There is no exposed Engine JSONRPC API because the Caplin light consensus beacon chain is embedded into this package.
