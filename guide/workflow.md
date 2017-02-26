---
layout: guide
---

## Deployment Options

The Blockchain Certificates standard does not cover the end-to-end workflow of the issuance cycle, which provides the Issuer flexibility in their deployments.

This document describes some choices an Issuer can make in a Blockchain Certificates deployment.

### How a Recipient provides their public key to the Issuer
There are no requirements for how a recipient sends their public key (Bitcoin address). In current deployments, Issuers have used one of the following (not exclusive) approaches:

**Option 1: Certificate wallet mobile app**  

The [cert-wallet mobile app](https://github.com/blockchain-certificates/cert-wallet) allows recipients to securely send their keys to an Issuer. This approach is simplest for the recipient, as it handles the complexity of securely generating and storing cryptographic keys. 

**Option 2: Web form** 

In some deployments, the [cert-viewer](https://github.com/blockchain-certificates/cert-viewer) web-based request form is used. This allows the recipient to securely generate and submit a public key (as well as other required information) to an Issuer. Some recipients find the concept of Bitcoin address generation confusing; in contrast, the certificate wallet mobile app hides these details from the recipient.

**Option 3: Email or some other trusted form of communication** 

Some blockcerts implementations have opted for a simpler solution, in which the learner simply sends their Bitcoin address through some already trusted form of communication, such as email. This lightweight approach has been used when an Issuer already has confidence that the email matches the identity of the intended recipient. This avoids the need for the Issuer to stand up an endpoint to receive requests (see next section).

## Issuer management of Recipient requests

### For small deployments
If the issuer has already confirmed the identity of the intended recipient, and the recipient sends their public address through a trusted form of communication, then the issuer may simply accumulate the recipient public keys in a spreadsheet.

### Larger deployments

For larger deployments, Issuers generally prefer more automation and coordination to handle recipient requests.  While not part of the standard, here are some techniques used in current deployments.

**Hosting an `introductions` endpoint to receive recipient information** 

The `introductions` endpoint in the [cert-viewer](https://github.com/blockchain-certificates/cert-viewer) demonstrates an endpoint that accepts requests (originating from the cert-viewer web form) and stores requests in a database. An approach like this is needed if the recipient is using the certificate wallet mobile app or a web form.

**Notifications** 

A Zapier Zap could be used to notify the Issuer when a recipient has requested a certificate (i.e. made an introduction) and consolidate the information in a Google spreadsheet to make it easier for the Issuer to review requests. An additional Zap synchronizes any updates to the spreadsheet (i.e. accept or reject request in the "Review" step) back to the requests database.

**Review requests** 

Before the issuer issues a batch of certificates, the issuer may to review requests, to ensure all submissions are valid. This is especially relevant in the case of a web form submission.


### Creating a Certificate Batch

The Issuer defines content the certificate content, which covers batch-global content (i.e. information applicable for all the recipients in this batch) and per-recipient content.

The cert-tools repository provides a reference implementation for defining the global and per-recipient content. This tool allows the Issuer to enter this information in a config file, and merge in recipient-specific details.

The issuer may define additional non-standard fields that apply to the entire batch.

After creating the certificate batch, the Issuer then signs and issues Blockchain Certificates, using the reference implementation in [cert-issuer](https://github.com/blockchain-certificates/cert-issuer).

### Notifying Recipients of Certificate Availability

The Issuer then notifies recipients that their certificates are available. This can be accomplished through email or an in-app notification. 

The Issuer should communicate any details about the hosting of the recipient certificates, see [Issuer Hosting](issuer-hosting.html). For example, if the Issuer does not intend to host the certificates permanently, the Issuer should tell the recipient to download a copy or import it into their wallet. The Issuer may also simply send the certificate as an email attachment to the recipient.

Because Blockchain Certificates are standalone JSON documents, it's easy for recipients to store backups and retain ownership, even if the Issuer is hosting certificates.

