---
layout: guide
---

## How Issuing works

While it is possible to issue one certificate with one Bitcoin transaction, it is far more efficient to use one Bitcoin transaction to issue a batch of certificates. 

The issuer builds a Merkle tree of certificate hashes and registers the Merkle root as the OP_RETURN field in the Bitcoin transaction. 

Suppose the batch contains `n` certificates, and certificate `i` contains recipient `i`'s information. The issuer hashes each certificate and combines them into a Merkle tree:

![](/assets/img/pictures/merkle.png)

The root of the Merkle tree, which is a 256-bit hash, is issued on the Bitcoin blockchain. The complete Bitcoin transaction outputs are described in 'Transaction structure'.

The Blockchain Certificate given to recipient `i` contains a [Chainpoint V2-formatted Merkle receipt](https://github.com/chainpoint/whitepaper/raw/master/chainpoint_white_paper.pdf) proving that certificate `i` is contained in the Merkle tree. 

<img src="/assets/img/pictures/blockchain_certificate_components.png" width="350">

This receipt contains:

*   The Bitcoin transaction ID storing the Merkle root
*   The expected Merkle root on the blockchain
*   The expected hash for recipient `i`'s certificate
*   The Merkle path from recipient `i`'s certificate to the Merkle root, i.e. the path highlighted in orange above. `h_i -> … -> Merkle root`

The [verification process](verification-process.html) performs computations to check that:

*   The hash of certificate `i` matches the value in the receipt
*   The Merkle path is valid
*   The Merkle root stored on the blockchain matches the value in the receipt

These steps establish that the certificate has not been tampered with since it was issued.

### Hashing a certificate

The Blockchain Certificate JSON contents without the `signature` node is the certificate that the issuer created. This is the value needed to hash for comparison against the receipt. Because there are no guarantees about ordering or formatting of JSON, first canonicalize the certificate (without the `signature`) against the JSON LD schema. This allows us to obtain a deterministic hash across platforms.

The detailed steps are described in the [verification process](verification-process.html).


### What should be in a batch?

How a batch is defined can vary, but it should be defined such that it changes infrequently. For example, “2016 MIT grads” would be preferred over “MIT grads” (the latter would have to be updated every year). The size of the batch is limited by the 100KB maximum transaction size imposed by the Bitcoin network. This will amount to a maximum of around 2,000 recipients per certificate batch.

### Transaction structure


One Bitcoin transaction is performed for every batch of certificates. There is no limit to the number of certificates that may be included in a batch, so typically batches are defined in logical groups such as "Graduates of Fall 2017 Robotics Class".

<img src="/assets/img/pictures/tx_out.png" width="350">

The transaction structure is the following:

*   Input:
    *    Minimal amount of bitcoin (currently ~$.80 USD) from Issuer's Bitcoin address
*   Outputs:
    *   OP_RETURN field, storing a hash of the batch of certificates
    *   Optional: change to an issuer address

The OP_RETURN output is used to prove the validity of the certificate batch. This output stores data, which is the hash of the Merkle root of the certificate batch. At any time, we can look up this value on the blockchain to help confirm a claim.

The Issuer Bitcoin address and timestamp from the transaction are also critical for the verification process. These are used to check the authenticity of the claim, as described in [verification process](verification-process.html).

