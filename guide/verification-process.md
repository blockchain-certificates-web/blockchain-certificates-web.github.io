---
layout: guide
---

## Verification Process

The [cert-verifier repo](https://github.com/blockchain-certificates/cert-verifier) provides a library for verifying Blockchain Certificates. However, anyone should be able to verify independently, whether manually or by writing their own library or service. These steps walk you through the certificate verification steps, using our sample certificates as an example.

These instructions will require a python interpreter and the Python [python-bitcoinlib](https://github.com/petertodd/python-bitcoinlib). These can be installed with:

    pip install python-bitcoinlib
    pip install pyld
    pip install merkle-proofs


### 1\. Get the certificate and blockchain transaction.

a\. First download a copy of a Blockchain Certificate. 

The steps below use this [sample Blockchain Certificate](http://www.blockcerts.org/mockissuer/examples/609c2989-275f-4f4c-ab02-b245cfb09017.json).

b\. Next, find the blockchain transaction id in the certificate.

This information is stored in the certificate under the `receipt` field: `anchors`[0].`sourceId`. In the sample certificate, that value is `8623beadbc7877a9e20fb7f83eda6c1a1fc350171f0714ff6c6c4054018eb54d`.

```
{
    "receipt": 
    {
        "@context": "https://w3id.org/chainpoint/v2",
        "merkleRoot": "68f3ede17fdb67ffd4a5164b5687a71f9fbb68da803b803935720f2aa38f7728", 
        "targetHash": "c9ead76a54426b4ce4899bb921e48f5b55ea7592e5cee4460c86ebf4698ac3a6", 
        "proof":
        [
            {
                "right": "7fef060cb17614fdfddd8c558e102fbb96433f5281e96c80f805459773e51163"
            }
        ],
        "type": "ChainpointSHA256v2", 
        "anchors": 
        [
            {
                "sourceId": "8623beadbc7877a9e20fb7f83eda6c1a1fc350171f0714ff6c6c4054018eb54d", 
                "type": "BTCOpReturn"
            }
        ]
    }
}
```

c\. Download the blockchain transaction record.

The blockchain transaction can be obtained from a service like [blockchain.info](http://blockchain.info/). The general query format is: http://blockchain.info/rawtx/<transaction_id>

Using the transaction id from the previous step, we download [http://blockchain.info/rawtx/8623beadbc7877a9e20fb7f83eda6c1a1fc350171f0714ff6c6c4054018eb54d](http://blockchain.info/rawtx/8623beadbc7877a9e20fb7f83eda6c1a1fc350171f0714ff6c6c4054018eb54d)

### 2\. Validate the receipt in the certificate.

    from merkleproof import utils
                
    with open(<INSERT_PATH_TO_LOCAL_CERTIFICATE_FILE>) as cert_file:
        certificate_json = json.load(cert_file)
        is_valid_receipt = utils.validate_receipt(certificate_json['receipt'])
        
    print "Valid Merkle receipt:"
    print is_valid_receipt      


### 3\. Compare the hash of the local certificate with the value in the receipt.
        
    import hashlib
    from pyld import jsonld
    
    valid_cert_hash = False
    with open(<INSERT_PATH_TO_LOCAL_CERTIFICATE_FILE>) as cert_file:
        certificate_json = json.load(cert_file)
        
    normalized = jsonld.normalize(certificate_json['document'], 
        {'algorithm': 'URDNA2015', 'format': 'application/nquads'})
    content_bytes = normalized.encode('utf-8')
    local_hash = hashlib.sha256(content_bytes).hexdigest()
    expected_certificate_hash = state.receipt['targetHash']
    if local_hash == expected_certificate_hash:
        valid_cert_hash = True
        
    print "Valid certificate hash:"
    print valid_cert_hash

### 4\. Compare the merkleRoot value in the certificate with the value on the Bitcoin blockchain.
        
    valid_merkle_root = False
    merkle_root = certificate_json['receipt']['merkleRoot']
    
    with open(<INSERT_PATH_TO_BLOCKCHAIN_TRANSACTION_FILE>) as trx_file:
        blockchain_data = json.load(trx_file)
        transaction_outs = blockchain_data["out"]
        for tx_out in transaction_outs:
            if tx_out.get("addr") == None:
                opreturn_tx = tx_out
        op_field = opreturn_tx["script"].decode("hex")
        op_return = op_field[2:]
        hash_from_chain = binascii.hexlify(op_return)

    if merkle_root == hash_from_chain:
        valid_merkle_root = True
        
    print "Valid Merkle Root:"
        print valid_merkle_root


### 5\. Check that the certificate was authored by the issuer.

To check that the certificate was authored by issuer, verify that the signature in the local certificate file was signed with the issuer's key.

The public key from the sample certificate can be found at [http://www.blockcerts.org/mockissuer/issuer/got_public_key_live.asc](http://www.blockcerts.org/mockissuer/issuer/got_public_key_live.asc) under the 'issuerKeys' field. This needs to be copy/pasted into the code.

    import json
    import binascii
    import hashlib
    from bitcoin.signmessage import BitcoinMessage, VerifyMessage, SignMessage

    valid_author = False

    ml_pubkey = <INSERT_ISSUER_KEY_HERE>

    uid = BitcoinMessage(certificate_json["assertion"]["uid"])
    if coin_data.get("signature", None):
        signed_uid = coin_data["signature"]
        valid_author = VerifyMessage(ml_pubkey, uid, signed_uid)

    print "Valid author:"
    print valid_author


### 6\. Check that the certificate has not been revoked

Check that the BTC transferred to the relevant revocation addresses has not been spent. The issuer may revoke the recipient's specific certificate or the whole batch. The recipient's specific revocation address is given in the certificate. The batch revocation key from the sample certificate can be found at [http://www.blockcerts.org/mockissuer/issuer/got_public_key_live.asc](http://www.blockcerts.org/mockissuer/issuer/got_public_key_live.asc) under the 'revocationKeys' field. This needs to be copy/pasted into the code.


    not_revoked = False

    revocation_address = <INSERT_REVOCATION_ADDRESS_HERE>
    
    recipient_revoke_key = None
    batch_not_revoked = False
    recip_not_revoked = False
    
    if 'revocationKey' in state.certificate_json['recipient']:
        recipient_revoke_key = state.certificate_json['recipient']['revocationKey']
        
    transaction_outs = blockchain_data["out"]
    for tx_out in transaction_outs:
        batch_not_revoked = tx_out.get("addr", None) == revocation_address and tx_out.get("spent", None) == False
        break

    if recipient_revoke_key:
        for tx_out in transaction_outs:
            recip_not_revoked = tx_out.get("addr", None) == recipient_revoke_key and tx_out.get("spent", None) == False
            break

    not_revoked = batch_not_revoked and recip_not_revoked
    print "Not revoked:"
    print not_revoked


### 7\. Check that all the above steps are valid. If so, the certificate is verified.
 
    valid_cert = False
    
    if is_valid_receipt and valid_cert_hash and valid_merkle_root and not_revoked:
        valid_cert = True

    print "Valid certificate:" 
    print valid_cert