---
layout: guide
---

## Display Guidelines

### General Principles
A Blockchain Certificate represents a remarkable achievement on behalf of the recipient. In order to honor that accomplishment, it's important that the display of the certificate be consistent across the various platforms and environments that it might be displayed in.

### Reuse standard open-source displays
By far, the easiest way to display a certificate in your application is to use one of the existing displays provided by the open source community. This will ensure a consistent experience for your users across any Blockchain Certificate application, with minimal effort on your part.

Here's a list of supported displays:

* The `<blockchain-certificate>` web component for rendering a certificate.
* The `<validate-certificate>` web component for in-browser validation of a certificate.
* The [RenderedCertificateView](https://github.com/blockchain-certificates/cert-wallet/tree/master/RenderedCertificateView) for iOS applications.

### The `<blockchain-certifiate>` web component

The easiest way to install the [standard web components](https://github.com/blockchain-certificates/cert-web-component) is to use bower. In your project, simply run:

```
bower install blockchain-certificate --save
```

Alternatively, you can clone [the blockchain-certifiate](https://github.com/blockchain-certificates/cert-web-component) repo and host it independently of your project by running `polymer serve` in a server environment, like [heroku](https://heroku.com). Note that this approach works best when you can run it on a subdomain, otherwise you'll have to set up Cross-Origin Resource Sharing in order for it to work correctly.

Once you've got the web components as part of your project, there's just a few simple steps to using them. These are also present in the project's [README file](https://github.com/blockchain-certificates/cert-web-component#using-blockchain-certificate).

1. (Optional) Include the web components polyfill to add support for older browsers.
2. Import the `blockchain-certificate.html` web component
3. Use the &lt;blockchain-certificate&gt; element and specify the href path to your certificate.

Let's look at an example.

Step 1: Include the web components polyfill for older browsers. It's important that this be loaded before any other front-end framework you might be using, like Angular or Ember.js.

```
<script src="/components/webcomponentsjs/webcomponents-lite.min.js"></script>
```

Step 2: Import the `blockchain-certificate` web component.

```
<link rel="import" href="/components/blockchain-certificate/blockchain-certificate.html">
```

Step 3: Use the `<blockchain-certificate>` element in the body of your page.

```
<blockchain-certificate href="/path/to/certificate.json">
</blockchain-certificate>
```

<!---
Once properly installed, you should see something like this:

<blockchain-certificate href="/assets/js/mit_certificate.json"></blockchain-certificate>
-->

### The `<validate-certificate>` web component
**Caution:** The validate-certificate component is only intended to be used in low-risk validation scenarios. It is strongly encouraged that anyone without an established, trusted relationship to the certificate's recipient use an independent verifier installed from a trusted source in order to properly validate the certificate. This prevents someone from writing a fake validator that simply looks like this component, but doesn't do proper validation.

The `<validate-certificate>` web component allows for in-browser validation of any hosted certificates. Using this component is easy. After installing or hosting the [blockchain-certificate repo](https://github.com/blockchain-certificates/cert-web-component), import the `validate-certificate` web component:

```
<link rel="import" href="/components/blockchain-certificate/validate-certificate.html">
```

Finally, wrap any `<blockchain-certificate>` elements in a `<validate-certificate>` tag.

```
<validate-certificate>
  <blockchain-certificate href="/path/to/certificate.json">
  </blockchain-certificate>
</validate-certificate>
```

Once that's done, you'll see the same rendered certificate with an associated Validate button. This will perform all of the necessary steps to validate the certificate in the browser.

<!---
This certificate validates at transaction ID `48f64ff1517554dac3496e9da0a28ca0ae492682b0898e38a4e17e7f90ee1295`:

<validate-certificate>
  <blockchain-certificate href="/assets/js/mit_certificate.json">
  </blockchain-certificate>
</validate-certificate>
-->

### Building your own display
If there isn't an existing framework you can use in your environment, follow the guidelines below. Once complete, we'd encourage you to open-source your implementation so others can benefit from your work.

**Rendering a Certificate**

A rendered certificate consists of 4 distinct sections:

1. The certificate's image, showing an identifying image of the issuer.
2. Title text. This shows the Recipient's name, the certificate's title, and the certificate's subtitle, if present.
3. Description. This is the long-form display detailing the accomplishment for which this certificate was issued.
4. The Undersigned. Here we have any titled signatures present on the certificate (coming in a later certificate format)
5. The seal. This is the issuer's image in the certificate.

Each of these sections should be shown with equal vertical space between them.
