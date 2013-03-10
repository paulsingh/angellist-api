The AngelList API Ruby Gem
==========================

A Ruby wrapper for the [AngelList REST APIs]. See the [YARD documentation] for
usage details.

Installation
------------

    gem install angellist_api

Configuration
-------------

Some API endpoints require authentication. [Register your app] with
AngelList to receive a [bearer token] and configure it as follows:

```ruby
AngellistApi.configure do |config|
  config.access_token = '<your token here>'
end
```

As bearer tokens are used, this library makes all requests over SSL. AngelList
does permit unauthenticated requests over plain HTTP, but we make no
distinction in this regard.

[Register your app]: https://angel.co/api/oauth/clients
[bearer token]: http://self-issued.info/docs/draft-ietf-oauth-v2-bearer.html

Developing
----------

Run `bundle` to install development dependencies, then run all specs with
`rake`. See `rake -T` for other possibilities.

### Integration Tests for Authenticated Endpoints

Integration tests should run against the [VCR] cassettes included in the
repository out of the box. However, if you need to add new specs or change
existing ones, you'll need to use your own private OAuth token. To do so, you
can set an `ANGELLIST_ACCESS_TOKEN` environment variable, or set this variable
through a [Foreman]-style `.env` file in the project directory. VCR's
sensitive data filtering feature is used to prevent recording your private
token.

This means, though, that endpoints returning data specific to the
authenticated user, such as messages or the `/me` endpoint, will require
fixtures to be manually edited and maintained so that tests do not rely on
real private information stored in the repository. The suggested workflow is
to simply record a request once, then edit the body of the response in the
cassette file, and set `:record => :none` for the spec(s) to prevent
accidental overwrites when fixtures are updated *en masse* in the future.

[VCR]: https://github.com/vcr/vcr
[Foreman]: https://github.com/ddollar/foreman

Submitting a Pull Request
-------------------------

1. Fork the project.
2. Create a topic branch.
3. Implement your feature or bug fix.
4. Add documentation for your feature or bug fix.
5. Run `bundle exec rake doc:yard`. If your changes are not 100% documented,
   go back to step 4.
6. Add specs for your feature or bug fix.
7. Run `bundle exec rake spec`. If your changes are not 100% covered, go back
   to step 6.
8. Commit and push your changes.
9. Submit a pull request. Please do not include changes to the gemspec,
   version, or history file. (If you want to create your own version for some
   reason, please do so in a separate commit.)

[AngelList REST APIs]: http://angel.co/api
[YARD documentation]: http://rdoc.info/gems/angellist_api/frames

