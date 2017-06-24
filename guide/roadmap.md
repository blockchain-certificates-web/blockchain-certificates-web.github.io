---
layout: guide
---

## Blockcerts Roadmap

The Blockcerts community is currently working to provide:

* Verifiable Claims compatible schemas
* Issuing and verification across multiple blockchains, including more expressive models for revocation
* Enhanced integration with Decentralized Identifiers
* Improving decentralization and longevity by removing dependencies on issuer-hosted data, where desired

To contribute to these efforts, join us at the [Blockcerts community forum](http://community.blockcerts.org/)

### Verifiable Claims schemas
Verifiable Claims is a lightweight format for expressing a cryptographically verifiable claim across many different use cases. Blockcerts and Open Badges are working towards expressing Open Badges assertions as a Verifiable Claim. This approach will expand (even further) the interoperability that exists within the Open Badge ecosystem.
 
In use cases outside of badges, this also allows a simpler, more generic schema on which to build a claim.

### Multiple Blockchains

Blockcerts will soon develop issuer and verifier support for more blockchains, with an initial focus on Ethereum.

### Revocation

The existing Blockcerts revocation model uses issuer-hosted revocations from the Open Badges specification. Many in the Blockcerts community are interested in expanding revocation options to allow:
- Reduced dependence on issuer-hosted information (from a decentralization and availability perspective)
- Recipient control, including recipient revocation
 
Blockcerts Ethereum contracts would provide a more natural, expressive and economical fit for achieving decentralized revocation. This and other means will be considered and developed as part of the Blockcerts suite.

### Decentralized Identifiers

Decentralized Identifiers (DIDs) enable more flexible and robust certificate ownership. For example, decentralized identity providers can allow means to recover an identity in case a cryptographic key is lost (whether via a forgotten passphrase, lost device, etc). This means that the recipient can retain control of the claim, and not have to re-request the claim from the issuer.
 
DIDs can also replace the current Blockcerts issuer identification scheme, which relies on an issuer-hosted list of valid keys from the OB spec.
 
Blockcerts continues to view identity as an external layer; however Blockcerts would provide hooks enabling the advantages of DIDs in a flexible and open manner.

### Improving decentralization and longevity

Several of the items above, such as enhanced revocation models and decentralized identifiers will contribute to Blockcerts’ commitment to a decentralized solution. This will also contribute to the longevity and availability of a recipient’s claim. For example, the validity of a claim should not be impacted by an issuer’s web site being down, or even the issuer going out of business. 
 