# Mail2FrontMatter::AutomaticClowncar

[Mail2FrontMatter](https://github.com/whistlerbrk/mail2frontmatter) plugin for [Middleman](https://middlemanapp.com/) specific blogs using [Automatic Clowncar](https://github.com/Octo-Labs/middleman-automatic-clowncar) to generate responsive images for your blog.

```Mail2FrontMatter::AutomaticClowncar``` replaces markup from inline attachments in an email with Automatic Clowncar compatible markup as well as placing your attachments in the namespaced directory (e.g. photos).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'm2fm-automatic-clowncar', require: false
```

And then execute:

    $ bundle

## Configuration

In your Mail2FrontMatter YAML configuration enable the plugin by adding it to your preprocessors:

```yaml
protocol: imap
receiver: yourblogemail@yourdomain.com
senders:  yourpersonal@yourdomain.com

preprocessors:
  - key: 'automatic-clowncar'
    options:
      namespace_directory: photos

mailman:
  server: imap.gmail.com
  port: 993
  ssl: true
  username: yourblogemail@yourdomain.com
  password: yourpassword
```

## Usage

That's it! Now incoming images will be moved to your namespaced directory or by default photos (source/photos). Additionally the markup will be changed to reflect that, and the next time you run middleman build, or in development, automatic clowncar should take care of the rest.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/m2fm-automatic-clowncar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
