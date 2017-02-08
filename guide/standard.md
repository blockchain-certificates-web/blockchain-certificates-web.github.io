---
layout: guide
---

## Blockcerts Standard

Blockchain Certificates open source falls into 3 categories: 

*   specifications, i.e. the definitions behind the Blockchain Certificates standard
*   reference implementations
*   implementation options

## Specifications

The Blockchain Certificates specification consists of:

*   The Blockchain Certificates schema, which describe the structure and content of a Blockchain Certificate [[Guide]](schemas.html)  [[Schema Repo]](https://github.com/blockchain-certificates/cert-schema)
*   Verification procedure -- how to independently verify a Blockchain Certificate [[Guide]](verification-process.html)
*   Issuer identification, which is used by the verification process to confirm signing keys [[Schema Repo]](https://github.com/blockchain-certificates/cert-schema)

## Reference Implementations

Reference implementations for the Blockchain Certificates specification include:

*   Creating a blockcerts-schema-compliant certificate:
  *   Creating an unsigned certificate [[cert-tools]](https://github.com/blockchain-certificates/cert-tools)
  *   Signing and issuing a blockcerts schema-compliant certificate [[cert-issuer]](https://github.com/blockchain-certificates/cert-issuer)
*   Verification
  *   Python library [[cert-verifier]](https://github.com/blockchain-certificates/cert-verifier)
  *   Javascript library [[cert-web-component]](https://github.com/blockchain-certificates/cert-web-component)
*   Display 
  *   Python library [[cert-viewer]](https://github.com/blockchain-certificates/cert-viewer)
  *   Mobile; iOS [[cert-wallet]](https://github.com/blockchain-certificates/cert-wallet)
  *   Javascript, web component [[cert-web-component]](https://github.com/blockchain-certificates/cert-web-component)

## Implementation options

Some of the Blockchain Certificates open source code are not part of the standard, but are implementation choices ranging from best practices (based on our experiences) to choices of convenience. These primarily have been created to support end-to-end workflows in live Blockchain Certificates deployments. Read more about implementation choices in supporting an end-to-end workflow [here](workflow.md).
