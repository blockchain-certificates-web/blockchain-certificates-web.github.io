---
layout: guide
---

## Using Web Components
[Web components](http://webcomponents.org) are a standard means of defining new elements for use in any web site. The Blockchain Certificates community provides a handful of web components to help make the standard display of a Blockchain Certificate as easy to adopt as possible.

### Installing the web component
The easiest way to install the [standard web components](https://github.com/blockchain-certificates/cert-web-component) is to use bower. In your project, simply run:
```
bower install blockchain-certificate --save
```

Alternatively, you can clone [the blockchain-certifiate](https://github.com/blockchain-certificates/cert-web-component) repo and host it independently of your project by running `polymer serve` in a server environment, like [heroku](https://heroku.com). Note that this approach works best when you can run it on a subdomain, otherwise you'll have to set up Cross-Origin Resource Sharing in order for it to work correctly.


### Rendering a certificate
Once you've got the web components as part of your project, there's just a few simple steps to using them. These are also present in the project's [README file](https://github.com/blockchain-certificates/cert-web-component#using-blockchain-certificate).

1. (Optional) Include the web components polyfill to add support for older browsers.
2. Import the `blockchain-certificate.html` web component
3. Use the &lt;blockchain-certificate&gt; element and specify the href path to your certificate.

Let's look at an example.

Step 1: Include the web components polyfill for older browsers.
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

Once properly installed, you should see something like this:

<blockchain-certificate href="/assets/js/mit_certificate.json"></blockchain-certificate>

### Validate button
There's also a web component to allow for in-browser validation of any hosted certificates. Using this component is just as easy. After installing or hosting the [blockchain-certificate repo](https://github.com/blockchain-certificates/cert-web-component), import the `validate-certificate` web component:

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

Once that's done, you'll see the same rendered certificate with an associated Validate button. This will perform all of the necessary steps to validate the certificate in the browser. It will look like this:

<validate-certificate>
  <blockchain-certificate href="/assets/js/mit_certificate.json">
  </blockchain-certificate>
</validate-certificate>

#### A word of caution
The validate-certificate component is only intended to be used in low-risk validation scenarios. It is strongly encouraged that anyone without an established, trusted relationship to the certificate's recipient use an independent verifier installed from a trusted source in order to properly validate the certificate. This prevents someone from writing a fake validator that simply looks like this component, but doesn't do proper validation.

For such scenarios, we highly recommend one of the open-source peer-reviewed validators:
* [cert-verifier](https://github.com/blockchain-certificates/cert-verifier) for command-line validation
* [cert-wallet](https://github.com/blockchain-certificates/cert-wallet) for iPhone & iPod Touch
