---
layout: guide
---

## Standards Alignment

Blockcerts uses open standards for recipient-centric certificates. The [cert-schema repo](https://github.com/blockchain-certificates/cert-schema) describes Blockcerts' Open Badges extensions enabling Blockchain verification

The Blockcerts community is aligned with (and contributing to) the following standards:

* [IMS Open Badges](openbadgespec.org)
* [W3C Verifiable Claims](https://w3c.github.io/vc-data-model/)
* [W3C Linked Data Signatures](https://w3c-dvcg.github.io/ld-signatures/)
* [W3C / Rebooting Web of Trust Decentralized Identifiers](https://github.com/WebOfTrustInfo/rebooting-the-web-of-trust-fall2016/blob/master/draft-documents/DID-Spec-Implementers-Draft-01.pdf)

Blockcerts’ open-source components conform to the above standards, demonstrating how such standards can be used in a viable system. This includes generating solutions for subtle difficulties arising in a real-world system, including:

* revocation of certificates
* identity of participants in a decentralized, self-sovereign mode
* other lifecycle concerns, including key management

### Design Principles

*   Open source
*   Reliance on open standards
*   Open participation
*   Recipient control
*   Simplicity
*   Minimize resource requirements (computation, cost, etc.)
*   Solution must be viable without any proprietary product
*   Blockchain-agnostic in the long term
*   Maximize confidence in the end product