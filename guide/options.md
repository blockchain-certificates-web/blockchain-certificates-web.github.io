---
layout: guide
---

## Issuing Options

Before issuing Blockchain Certificates on the Bitcoin blockchain, which requires spending money, you should experiment in test modes to ensure your transaction outputs are as expected. The cert-issuer tool allows you to experiment with test modes through configuration options.

### Regtest Issuing

Regtest mode is the simplest way to simulate interacting with the Bitcoin blockchain. It’s a local Bitcoin test environment that can generate fake coins for issuing test certificates.

We recommend that you issue your first test certificates in regtest mode. Our ["Quick start using Docker"](https://github.com/blockchain-certificates/cert-issuer) steps uses this mode by default.

### Testnet Issuing

Testnet mode also does not spend real Bitcoins, but it is a closer simulation to issuing certificates on the Bitcoin blockchain. Both testnet and mainnet are enabled by using APIs to broadcast Bitcoin transactions.

[Issuing modes](https://github.com/blockchain-certificates/cert-issuer/blob/master/docs/bitcoin_options.md) describe how to run the certificate issuer in testnet mode.

### Mainnet (Live) Issuing

Issuing live certificates requires a small amount of Bitcoin -- for 1 certificate, it is roughly 10 cents in USD; a batch of 100 certificates is under $3 USD. 

If this is your first time purchasing Bitcoin, start by reading ["Getting started with Bitcoin"](https://bitcoin.org/en/getting-started). Specifically, the first section "How to use Bitcoin" is an overview of choosing a wallet, obtaining your first Bitcoins, and securing your money.

[Issuing modes](https://github.com/blockchain-certificates/cert-issuer/blob/master/docs/bitcoin_options.md) describe how to run the certificate issuer in mainnet mode.


**Best practice: Keep a small balance**

In a deployed environment, you will want to keep a small balance associated with your issuing address. You can transfer a small amount to the issuing address before running the cert-issuer tool.
