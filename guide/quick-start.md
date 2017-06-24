---
layout: guide
---

## Quick Start

### Viewing and verifying certificates

The easiest way for developers to get familiar with Blockchain Certificates is to clone the [cert-web-component](https://github.com/blockchain-certificates/cert-web-component) repo and perform the steps in the README to launch. After this, you will be able to view and verify sample certificates locally.

Other tools for viewing and verifying certificates include:
*   [cert-verifier-js](https://github.com/blockchain-certificates/cert-verifier-js): Javascript library for Blockcerts verification that can be used in a Node.js app or a browser
*   [cert-verifier](https://github.com/blockchain-certificates/cert-verifier): Python library for Blockcerts verification
*   [cert-viewer](https://github.com/blockchain-certificates/cert-viewer): Python Flask app for viewing and verifying Blockcerts


### Issuing certificates end-to-end

![](/assets/img/pictures/issuing_process.png)

You can create, issue, and view your own certificates in test modes, which doesn't require spending Bitcoin. We highly recommend trying this process in test mode before issuing certificates on the live Bitcoin blockchain.

The full process is:

*   First you need certificates to sign and issue. You can either:
    *    Use the sample unsigned certificate available in cert-issuer (skip to the next step if so)
    *    Create your own unsigned certificates [cert-tools](https://github.com/blockchain-certificates/cert-tools) and copy these to the 'data/unsigned_certificates' input directory of cert-issuer
*   Run the [cert-issuer](https://github.com/blockchain-certificates/cert-issuer) quick start steps
*   Copy the blockchain certificates you issued out of the docker container to a local directory
    ```
    docker cp <docker-container-id>:/etc/cert-issuer/data/blockchain_certificates/<your-certificate-guid>.json <path_to_local_dir>
    ```
    
*   View your certificates in a browser
    *    Javascript web component [cert-web-component](https://github.com/blockchain-certificates/cert-web-component): copy your certificates into  `<cert-web-component-home>`
    *    Python Flask app [cert-viewer](https://github.com/blockchain-certificates/cert-viewer): copy your certificates into `<cert-viewer-home>/cert_data`


Each of our github repositories has detailed information; start with the README.md for each.
