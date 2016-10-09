---
layout: guide
---

## System Overview

### Certificate issuing

The cert-issuer component is responsible for issuing certificates on the blockchain. The current version uses the Bitcoin blockchain.

![](/assets/img/pictures/system-overview.png)

Two tasks are performed by the certificate issuer:

1.  Open badge signature
2.  Issue on blockchain

Because the open badge signature is independent from issuing the certificate as a transaction on the blockchain, that signature will likely be pulled out as a separate component in the future.

The input is an unsigned certificate; see the [schema description](schemas.html).

The signing step signs the recipient UID field in the unsigned certificate and places the signature in the signature section of the certificate. The signed certificate is retained as output, since the hash of this document is what is stored on the blockchain.

The next step creates a Bitcoin transaction with the signed certificate hash and outputs to the recipient and the revocation address.

The cert-issuer’s output is the signed certificate and the Bitcoin transaction ID. These two suffice to validate the certificate.

### Certificate viewing, storage, and validation

An additional level of convenience can be achieved through the use of a web app for storing, looking up, and performing validation of the certificates issued. This is technically optional. With the signed certificate and the Bitcoin transaction ID, the recipient could share their certificate with any third party, and that third party could independently validate the certificate.

![](/assets/img/pictures/system-overview2.png)

Lookup and storage requirements will vary according to the sensitivity of the data. In this digital certificate scenario, recipients preferred the convenience of having a verification button on the certificate for low-stakes situations. The outputs of the signed certificate and transaction ID suffice to validate the certificate. The means of validating the certificate are open.

### Verification

Verification is clearly a core consideration, but it is described separately because the technique of validating a certificate can be achieved in a variety of ways.

[These steps show how you would independently verify a certificate](verification-process.html). Note that these steps could have been performed without involving the issuer’s viewer page in two different ways:

*   The recipient directly provides the signed certificate and transaction ID.
*   The issuer and revocation keys are available in the bitcoin transaction. The “from” address is the issuer, and the revocation address is the output that is not the recipient address. There may also be a change output going back to the issuer.

