---
layout: guide
---

## Batch Issuing (Technical Details)

While you can issue one certificate with one Bitcoin transaction, it is far more efficient to use one Bitcoin transaction to issue a batch of certificates. The batch limit is roughly 2,000 and is determined by the Bitcoin transaction size limit.

The issuer builds a Merkle tree of certificate hashes and registers the Merkle root as the OP_RETURN field in the Bitcoin transaction.

Verification of certificates issued as a batch changes the validation process because the recipient must prove their certificate’s location in the tree. The Chainpoint JSON LD schema is currently being used for [Merkle receipts](https://github.com/chainpoint/whitepaper/raw/master/chainpoint_white_paper.pdf).

A batch-issued certificate is verified by the Merkle proof/receipt, which consists of:

*   The recipient’s signed certificate
*   The transaction on the blockchain
*   A path to the recipient’s signed certificate in the Merkle tree

How a batch is defined can vary, but it should be defined such that it changes infrequently. For example, “2016 MIT grads” would be preferred over “MIT grads” (the latter would have to be updated every year). The size of the batch is limited by the 100KB max transaction size imposed by the Bitcoin network. This will amount to a max of around 2,000 recipients per certificate batch.

### Transaction structure

Each recipient’s Bitcoin address and revocation address are included in the transaction outputs.

*   Revocation is the same, but the recipient’s revocation address (owned by the issuer) would need to be included in the certificate.
*   Issuer needs to track the revocation private/public key per recipient.
*   Verification needs to check whether the revocation address mentioned in the certificate is spent. If so, then the certificate hash is invalid.
*   Cost is a function of certificate batch size.

### Diagrams

Below are sketches of the multiple recipient output batch approach.

### Certificate addition: recipient-specific revocation field

![](/assets/img/pictures/cert_i.png)

### Merkle structure

![](/assets/img/pictures/merkle.png)

### Transaction outputs: public/revocation pair per recipient

![](/assets/img/pictures/tx_out.png)

### Addition to recipient’s proof (compared to v1)

In addition to the signed certificate and transaction ID, a receipt establishes the location of the certificate within the Merkle tree. For a recipient in the Merkle tree above, this is the path:

root -> … hash((i-1)+i) -> …hi
