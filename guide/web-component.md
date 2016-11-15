---
layout: guide
---

## Standard Web Display

### Rendering a certificate
1. Import the web component
2. Use the &lt;blockchain-certificate&gt; element and specify the href path to your certificate.

Let's look at an example.

```
<blockchain-certificate href="/path/to/certificate.json">
</blockchain-certificate>
```

Substitute your own path and bam! You get something like this:

<blockchain-certificate href="/assets/js/mit_certificate.json"></blockchain-certificate>

### Validate button
You can also wrap it in another web component if you want to proveid ava lidate button. This goes through all the sepc neccesary to alidate a certificate in-browser. Super useful for showing folks you're not kidding.

Note: This should only be used for low-risk validations. In-browser validatoin is super easy to fake. So there's that

```
<validate-certificate>
  <blockchain-certificate href="/path/to/certificate.json">
  </blockchain-certificate>
</validate-certificate>
```

And here's what that looks like, with the same demo certificate from above:

<validate-certificate>
  <blockchain-certificate href="/path/to/certificate.json">
  </blockchain-certificate>
</validate-certificate>
