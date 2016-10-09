---
layout: guide
---

## Identity FAQ

### Does this project prove the identity of an individual or issuer?

The Blockchain Certificates project is not attempting to solve identity. In other words, this solution does not certify the mapping of public keys to individuals or organizations. Further, there is no registration process in this system, so any issuer may issue certificates. A recipient may provide any Bitcoin address. The system makes no attempt to verify their identity. However, it is in the issuer’s and recipient’s interest to provide public addresses they own, because this is the only way either can demonstrate ownership of or revoke certificates.

### Why is identity out of scope?

The primary reason is that separation of identity is desirable from an architectural layering perspective. For a certification system, it’s reasonable that adopters will want to establish identity in different ways, and we want to give them this flexibility. At the same time, our design doesn’t preclude identity association. Since the Bitcoin addresses can be any address, recipients and issuers can choose ones associated with a curated profile (e.g. Blockstack profiles).

### How do you know a certificate is valid?

The [verification process](verification-process.html) answers questions about the certificate’s integrity and validity:

*   Is the certificate the same as when the issuer issued it? (i.e. How do I know it wasn’t tampered with?)
*   Was the certificate revoked?

The verification process ensures that the certificate you see wasn’t tampered with by comparing hashes with what is registered on the blockchain. It ensures the certificate wasn’t revoked through a convention that relies on spending transaction outputs. [See detailed steps.](verification-process.html)

### How does the issuer or recipient prove their association with a certificate?

This codebase allows the issuer and the recipient to make cryptographically strong claims: if either party owns a certificate’s issued-by or issued-to address, then they can also sign a statement with their corresponding private key. Only the owner of the corresponding private key can do this.

The wallet (mobile app) and issuer software will provide a capacity to prove ownership if requested. Currently, the issuer provides a link to their credentials in the certificate, and the standard validation process performs a cryptographic check that the public key at that link actually signed the certificate.
