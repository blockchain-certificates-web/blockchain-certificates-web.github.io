# Blockcerts.org

# Note about NPM
We rely on npm for the @blockcerts dependencies, but this is not a JS project. We use npm as a static provider for the latest versions of the dependencies, which will be consumed later on by the HTML.

# Updating blockcerts verifier

Run `. ./scripts/update_blockcerts_verifier.sh`

This will commit and push the update automatically.

# Updating blockcerts schemas

Run `. ./scripts/update_blockcerts_schemas.sh`

After installing the package, the script will copy the schemas to the expected directory.
This will commit and push the update automatically.

# Testing changes locally
You can [follow this guide](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/) for the full instructions. Below is an abbreviated version.

1. Run `gem install bundler`. You may need to prefix this with `sudo`.
2. Install all the dependencies (including Jekyll) with `bundle install`.
3. Run the site locally with `bundle exec jekyll serve`.

You should see the site running at [http://127.0.0.1:4000](http://127.0.0.1:4000). It'll pick up changes as you make them; just refresh the browser to see any updates you make.
