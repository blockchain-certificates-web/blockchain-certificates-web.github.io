---
layout: guide
---

## Bitcoin FAQ

### Why use a blockchain instead of a PKI infrastructure?

The decision to use a blockchain was driven by three core principles of our project:

1.  Anyone may issue and receive certificates.
2.  Identity is intended as a separate layer.
3.  Optimizing for simple primitives that enable proofs of a claim, without reliance on certificate authorities.

A blockchain offers more than encryption. It is a distributed network that enables exchanging things of value peer-to-peer.  This network can’t be easily gamed or taken down, so it offers a convenient and long-lasting solution for individuals to hold and share their official records. The blockchain also provides an independent and permanent timestamp, which is stored separately from the certificate. Verifying a credential requires checking that it originated from a particular Issuer while the embedded issuing key was valid. This requires knowledge of the timestamp beyond anything written into the credential itself.



### What exactly is in the Bitcoin transaction?

One Bitcoin transaction is performed for every batch (maximum size ~2000) of certificates. The transaction outputs are:

*   OP_RETURN field, storing a hash of the batch of certificates
    *   One output to the recipient’s address, dust amount
    *   One output to the issuer’s revocation address, dust amount
*   Optional: change to the issuer address

The OP_RETURN output is used to prove the validity of the certificate batch. This output stores data, which is the hash of the Merkle root of the certificate batch. At any time, we can look up this value on the blockchain to help confirm a claim.

The recipient and issuer revocation outputs are used for selective revocation of certificates in the batch, either by the recipient or the issuer.

### What is an OP_RETURN code?

Original attempts to store non-financial transactions on the Bitcoin blockchain resulted in bloat of the Bitcoin unspent transaction database (UTXO). The OP_RETURN code was introduced by the Bitcoin core developers to address ([but not necessarily endorse](https://en.bitcoin.it/wiki/OP_RETURN)) the increasing desire of people to store non-financial data. The code signifies that an output is provably unspendable, allowing transactions to be pruned from the UXTO database.

### What is dust?

It is the minimum amount a transaction output can be. Bitcoin Core defines dust to be an output whose fees exceed 1/3 of its value, and it is defined as 546 satoshis in the code. Dust is relevant for the Blockchain Certificates project because we rely on Bitcoin transaction outputs for revocation. These outputs must be greater than or equal to the dust value.

### How did you come up with the transaction fee?

We used the current value of ‘To get in next block’ of [Recommended Bitcoin Network Transaction Fees](http://bitcoinexchangerate.org/fees).

### Other resources that were helpful in creating raw bitcoin transactions and computing fees:

*   Calculating transaction size
*   Creating raw transactions
*   Dust limit
