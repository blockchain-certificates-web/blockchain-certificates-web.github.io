---
layout: guide
---

## Blockchain FAQ

### Why use a blockchain instead of a PKI infrastructure?

In Blockcerts, the issuer uses their digital signature to provide a credential to a recipient, identified by a recipient-owned public key, and issued on the blockchain. The recipient's credential contains the Merkle proof linking the credential with a specific blockchain transaction. This is used to establish integrity of the credential; i.e. that it hasn't been tampered with. Additionally, the recipient-owned public key embedded in the credentials allows the recipient to prove ownership.

To establish authenticity, one must establish that the issuer owned the issuing key at the time the credential was issued. This is why a reliable timestamp is needed. This could be done through use of a timestamping authority (TSA) -- more commonly used in a PKI solution -- but that places a dependency on a trusted third party. 

In contrast, blockchain provides permanent, trusted timestamping by design. It requires massive computational effort -- rewriting the entire blockchain -- to tamper with the timestamps. Read more on [blockcerts wiki](https://github.com/blockchain-certificates/cert-schema/wiki/Why-the-blockchain)


### What exactly is in the Bitcoin transaction?

One Bitcoin transaction is performed for every batch of certificates. There is no limit to the number of certificates that may be included in a batch, so typically batches are defined in logical groups such as "Graduates of Fall 2017 Robotics Class".

The transaction inputs and outputs are as follows:

*   Input:
    *    Minimal amount of bitcoin (currently ~$.80 USD) from Issuer's Bitcoin address
*   Outputs:
    *   OP_RETURN field, storing a hash of the batch of certificates
    *   Optional: change to an issuer address

The OP_RETURN output is used to prove the validity of the certificate batch. This output stores data, which is the hash of the Merkle root of the certificate batch. At any time, we can look up this value on the blockchain to help confirm a claim.

### What is an OP_RETURN code?

Original attempts to store non-financial transactions on the Bitcoin blockchain resulted in bloat of the Bitcoin unspent transaction database (UTXO). The OP_RETURN code was introduced by the Bitcoin core developers to address ([but not necessarily endorse](https://en.bitcoin.it/wiki/OP_RETURN)) the increasing desire of people to store non-financial data. The code signifies that an output is provably unspendable, allowing transactions to be pruned from the UXTO database.

### What determines the cost?

A Bitcoin transaction is determined by the size of the transaction and the transaction fee. 

Blockcerts transaction sizes are static and small -- they add a single fixed-size OP_RETURN output on top of a standard single-input, single-output transaction. This is true no matter the number of certificates in a batch.

So the cost to issue a batch of Blockcerts is largely influenced by the transaction fee, which is a fee paid to miners to ensure timely mining of transactions. The recommended fee changes over time; current recommended values can be obtained from ‘To get in next block’ of [Recommended Bitcoin Network Transaction Fees](http://bitcoinexchangerate.org/fees).

In the cert-issuer project, the transaction fee is configurable. The default value was selected as a higher value to reduce wait time. This setting can be overridden in the config file to reduce the cost, but it may result in long waits.



