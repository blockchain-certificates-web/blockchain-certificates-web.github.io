---
layout: guide
---

## System Overview

### Issuing Components

The following diagram shows the components a certificate issuer uses to:

*   create certificates for a roster of recipients
*   cryptographically sign the certificates
*   issue the certificates on the Bitcoin blockchain

![](/assets/img/pictures/issuer-dataflow.png)

**cert-tools**

Cert-tools allows issuers to create Blockchain Certificate compliant certificate templates, and populate certificates for a (csv-formatted) recipient roster. More information is available at
[creating certificates](creating-certificates.html)


**cert-issuer**

The cert-issuer component is responsible for issuing certificates on the Bitcoin blockchain.

### Certificate Distribution and Ecosystem

![](/assets/img/pictures/cert-dataflow.png)

Once the Blockchain Certificates have been issued, the issuer will distribute them. They will add them to a certificate store, which is generally owned by the issuer, but not required. This allows anyone with the certificate URL to view and verify the certificate. The cert-verify component is separate from the viewer -- this allows any party to serve as a certificate verifier without needing to store the data. 

The issuer should notify the recipients to let them know a certificate is available. This allows the recipients to import their certificate into their cert-wallet mobile app. The issuer may also email the certificate, and this can later be imported into a wallet, emailed to a 3rd party, and independently verified. [These steps show how you would independently verify a certificate](verification-process.html)

**cert-wallet**

The cert-wallet mobile app allows recipients to request and import Blockchain Certificates. This app allows the recipient to connect with issuers, import Blockchain Certificates into the mobile app where they can be viewed, verified, and shared.

**cert-viewer**

The cert-viewer Flask web app allows certificates to be looked up by URL. This allows the recipient to share their URL to 3rd parties for viewing and verifying.

**cert-verifier**

Cert-verifier performs the [verification steps described here](verification-process.html) to verify a Blockchain Certificate.

Cert-viewer uses cert-verifier as a library, but cert-verifier could be stood up as an independent service to allow anyone to upload and verify a Blockchain Certificate.

**cert-store**

Cert-store is simply a UID to a certificate lookup store. While it is MongoDB in the open source project, it can be any blob store that allows efficient access. This is used as a backing store for cert-viewer and certificate wallets importing into the app.

