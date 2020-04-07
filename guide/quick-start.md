---
layout: guide
---

## Quick Start

### Viewing and verifying certificates

The easiest way for developers to get familiar with Blockchain Certificates is to clone the [blockcerts-verifier](https://github.com/blockchain-certificates/blockcerts-verifier) repo and perform the steps in the README to launch. After this, you will be able to view and verify sample certificates locally.

Developers wishing to create their own UI but leverage Blockcerts tooling for verification can use the [cert-verifier-js](https://github.com/blockchain-certificates/cert-verifier-js) project. This Javascript library for Blockcerts verification can be used in a Node.js app or a browser. We are currently using this library for [blockcerts-verifier](https://github.com/blockchain-certificates/blockcerts-verifier), the Blockcerts [iOS wallet](https://github.com/blockchain-certificates/wallet-iOS), and the [Android wallet](https://github.com/blockchain-certificates/wallet-android).

If developing a separate library or those looking for more information about the verification process, that can be found [here](https://github.com/blockchain-certificates/cert-verifier-js/blob/master/docs/verification-process.md).

Some examples of certificates can be found in the [cert-schema](https://github.com/blockchain-certificates/cert-schema/tree/master/examples) repo.


### Issuing certificates end-to-end

![](/assets/img/pictures/issuing_process.png)

You can create, issue, and view your own certificates in test modes, which doesn't require spending Bitcoin. We highly recommend trying this process in test mode before issuing certificates on the live Bitcoin blockchain.

The full process is:

*   Create certificates with [cert-tools](https://github.com/blockchain-certificates/cert-tools) or skip this step to use the sample ones in [cert-issuer](https://github.com/blockchain-certificates/cert-issuer/tree/master/examples/data-testnet/unsigned_certificates).
*   Copy the certificates and issue them with [cert-issuer](https://github.com/blockchain-certificates/cert-issuer). Follow the [quick-start-using-docker](https://github.com/blockchain-certificates/cert-issuer#quick-start-using-docker) guide to get started easily.
*   Run the [blockcerts-verifier](https://github.com/blockchain-certificates/blockcerts-verifier) project to verify the certificates you just issued. You can drag and drop them directly onto the browser. 
*   Import them into the [iOS wallet](https://github.com/blockchain-certificates/wallet-iOS) or the [Android wallet](https://github.com/blockchain-certificates/wallet-android) to verify them there as well.


## Repository Summary

Below is a quick summary of the main Blockcerts repositories we have that are currently in use. Check out the README.md page for each of them to get a better understanding.


*   [cert-schema](https://github.com/blockchain-certificates/cert-schema): The schemas and specifications for Blockcerts. Includes a python library for verifying schema & JSON-LD. 
*   [cert-tools](https://github.com/blockchain-certificates/cert-tools): Python library for creating customizable Blockcerts for a list of recipients.
*   [cert-issuer](https://github.com/blockchain-certificates/cert-issuer): Python library for issuing Blockcerts onto the Bitcoin or Ethereum blockchain.
*   [cert-verifier-js](https://github.com/blockchain-certificates/cert-verifier-js): Javascript library for Blockcerts verification that can be used in a Node.js app or a browser.
*   [blockcerts-verifier](https://github.com/blockchain-certificates/blockcerts-verifier): A standalone universal viewer & verifier for Blockcerts credentials.
*   [wallet-iOS](https://github.com/blockchain-certificates/wallet-iOS): iOS wallet for adding Blockcerts issuers, maintaining keys, and holding Blockcerts.
*   [wallet-android](https://github.com/blockchain-certificates/wallet-android): Android wallet for adding Blockcerts issuers, maintaining keys, and holding Blockcerts.
