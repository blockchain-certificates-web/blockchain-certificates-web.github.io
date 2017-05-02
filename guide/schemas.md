---
layout: guide
---

## Schemas

Blockchain Certificate schemas extend those of [Open Badges](https://openbadgespec.org/). As with Open Badges, we've provided both a JSON-LD context and JSON schema. The purpose of the JSON-LD context is to map types to Internationalized Resource Identifiers (IRIs), providing semantic context for data. The JSON Schema is used for syntactic validation.

*   [Blockchain Certificate (Assertion) Schema](schema.html) (components below)
    *   [Issuer Profile Schema](issuer_schema.html)
    *   [OBI Extension: Merkle Proof Schema](merkleProofSignatureExtension_schema.html)    
    *   [OBI Extension: Recipient Profile Schema](recipientProfileExtension_schema.html)
    *   [OBI Extension: SignatureLine Schema](recipientProfileExtension_schema.html)  

[See V1.2 Schema](v1_x_schema.html)


### Example

```json
{
  "@context": [
    "https://openbadgespec.org/v2/context.json",
    "http://www.blockcerts.org/blockcerts_v2_alpha/context_bc.json"
  ],
  "type": "Assertion",
  "issuedOn": "2017-05-01",
  "id": "urn:uuid:7e1722d1-b8bd-465a-895e-410d0558f91f",
  "badge": {
    "description": "This is the display description of the certificate.",
    "type": "BadgeClass",
    "id": "urn:uuid:5106bba8-2c1a-457f-9c17-ce8831aa9d80",
    "image": "data:image/png;base64,...",
    "issuer": {
      "type": "Profile",
      "id": "https://www.blockcerts.org/blockcerts_v2_alpha/samples/issuer_testnet.json",
      "image": "data:image/png;base64,...",
      "revocationList": "https://www.blockcerts.org/blockcerts_v2_alpha/samples/revocation_list.json",
      "url": "https://www.blockcerts.org",
      "name": "Issuer Institution Name",
      "email": "contact@issuer.org"
    },
    "name": "This is the certificate title",
    "signatureLines": [
      {
        "jobTitle": "CEO",
        "type": [
          "SignatureLine",
          "Extension"
        ],
        "image": "data:image/png;base64...",
        "name": "Big Boss"
      }
    ],
    "criteria": {
      "narrative": "Recipient must do work that makes them worthy of this badge"
    }
  },
  "recipient": {
    "type": "email",
    "recipientProfile": {
      "type": [
        "RecipientProfile",
        "Extension"
      ],
      "name": "Arya Stark",
      "publicKey": "ecdsa-koblitz-pubkey:mtr98kany9G1XYNU74pRnfBQmaCg2FZLmc"
    },
    "identity": "aryaxyz@starkxyz.com",
    "hashed": false
  },
  "verification": {
    "type": [
      "MerkleProofVerification2017",
      "Extension"
    ],
    "creator": "ecdsa-koblitz-pubkey:msBCHdwaQ7N2ypBYupkp6uNxtr9Pg76imj"
  },
  "signature": {
    "type": [
      "MerkleProof2017",
      "Extension"
    ],
    "targetHash": "335f8b300b6972112d970a92e22ae7ad010e6efb79d2600c48685d4ac40516e1",
    "proof": [
      {
        "right": "4298534bd9ac0eeb59ccf767b2da67e4203abc66b9b7b4df398cdce50c4460b2"
      }
    ],
    "anchors": [
      {
        "type": "BTCOpReturn",
        "sourceId": "08e205566662b97f149ad677649bbb94ebc2f46c0ac72bc7c9b57d2d207015f4"
      }
    ],
    "merkleRoot": "bb1093d7d20afd94d64e0284697b9ae46da767db336cf3c9bb6d00daf3ac3ce0"
  }
}

```

### Source

All schema source files are located in [the cert-schema repo](https://github.com/blockchain-certificates/cert-schema/).
