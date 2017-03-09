---
layout: guide
---

## Bitcoin dependencies

Blockcerts has minimal Bitcoin dependencies by design. You don't need to run a Bitcoind node(1), or even use an SPV wallet unless you choose to go that route for your wallet provider. See [Getting started with Bitcoin](https://bitcoin.org/en/getting-started) for information about buying your first Bitcoin, wallet options, etc.

Blockcerts testnet and mainnet [issuing modes](options.html) require only Bitcoin APIs and libraries for the following functions:
 
 - looking up transactions
 - broadcasting signed transactions
 
These APIs are publicly available and do not require account setup. The blockcerts cert-issuer uses the pycoin provider framework for managing Bitcoin API providers. This includes fallback functionality in case a single provider fails. 

Transaction signing relies on your private issuer signing key, which should be stored securely, as described in [creating bitcoin addresses](https://github.com/blockchain-certificates/cert-issuer/blob/master/docs/make addresses.md). This setup requires you to transfer a small amout of coin to your issuing address before issuing blockcerts.

(1) A bitcoind node is only required for regtest issuing mode, since there are no API providers for regtest. The bitcoind setup is performed by the docker container used in the Quick Start steps.



