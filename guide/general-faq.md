---
layout: guide
---

## General FAQ

### Is private information now available on the Bitcoin blockchain?

The short answer is no. What is stored on the blockchain is a 1-way hash. This makes it useful only for verification; i.e. you can hash a certificate and compare to what is on the blockchain. And given what is on the blockchain, the original data cannot be feasibly recovered. This makes it easy for a recipient to reveal a certificate only to intended third parties.

### Are blockchain certificates tamper-proof?

Yes, the blockchain is an immutable and distributed store of transactions, with each block building upon the last. When a certificate is issued, its data is compressed into a hash and logged on the blockchain. This generates a “receipt” that can always be checked at a later date. The verification service validates the signature of the issuer and the certificate data; it also ensures that the certificate status has not expired or been revoked.

The friendly version of the certificate displayed online may shift visually, depending on the device displaying it. For instance, it may appear one way in a mobile app and slightly differently in a web browser. While this display may be optimized for different circumstances, the data within the certificate can never be changed.

### Can blockchain certificates be spoofed?

The friendly display of certificates could be spoofed to trick a non-technical viewer. This is why it is important to use a separate verification service when circumstances are important. While the issuer may include a friendly verification button below a certificate, the most secure way to ensure a certificate is valid is to use a separate verification service to check the blockchain. That cannot be spoofed.

### Can issued certificates be edited?

Certificates are immutable and cannot be updated. We recommend defining batches as a logical grouping of recipients that are not expected to change, e.g. “Graduates of 2017” vs “Graduates.” The issuer may revoke certificates that have mistakes, or, if they simply left out an eligible recipient, the issuer may issue another batch.

### How are certificates revoked?

Even though certificates can be issued to a cohort of people, the issuer can still revoke from a single recipient by spending the revocation address that they generated for a particular recipient. This revocation address is listed in the certificate and is part of the hashed certificate payload on the blockchain. The [verification process](verification-process.html) checks if the output was spent and will display it as revoked in that case.

### Can blockchain certificates allow for selective disclosure of information?

In general, we anticipate the need for a range of solutions balancing convenience, privacy, and security. For example, a recipient may want it to be easy for third parties to view and verify that they graduated with a B.A. from a university with a certain GPA, but only want to expose basic transcript information.

This can currently be achieved through issuing separate certificates, one for high-level information and another with detailed personal information for use in very specific situations.

Fully-featured selective disclosure within a single certificate is theoretically possible by spreading the contents of a document across a merkle tree. This may be addressed in future releases.

### Can an issuer create a public catalog of issued certificates?

Issuers must handle recipient information with care. In some previous deployments, participants (issuers and recipients) have chosen to make the original certificates easily discoverable through a certificate web site. This is because the certificates didn’t contain private or sensitive information, and the recipients wanted to promote their certificates.

However, certificates containing personal information, such as the recipient’s address, should be shielded from public disclosure. So, the basic implementation can omit this certificate browsing capability. This is similar to the [Proof of Existence](https://proofofexistence.com/) approach, which avoids disclosing any information unless the recipient chooses to do so.
