## Master

## 1.1.0 - 26 April, 2015

- **Breaking**: The `feed_item` client method to retrieve a single activity feed
  entry has been removed, because the endpoint was apparently removed by
  AngelList (see [the API doc page][api-activity-feeds]).

    Apologies for the breaking change in a minor version bump, but really removing
    an endpoint should have prompted AngelList to bump *their* API version :-(
- The Jobs endpoints now all require authentication.
- Of note for contributors: the test suite should now work with Faraday 0.9, as
  we claim to support in our dependency declarations. Be warned that Faraday's
  maintainers have slated it for the chopping block, we will be looking at
  alternatives for the future of this gem.

## 1.0.7 - 18 October, 2013

- Load Gemfile.local for optional development support libraries ([Rahil Sondhi])
- Add GET /reviews/:id endpoint ([Michael Revell])
- Add GET /startups endpoint, currently only supports :filter => :raising
  ([Pedro Freitas])

## 1.0.6 - 14 April, 2013

- Properly raise a `TooManyRequests` error when a 403 contains a JSON error
  object indicating rate limit overage (`EnhanceYourCalm` error aliased for
  backwards compatibility) ([Ches Martin])
- Add missing options parameters for passing pagination params to endpoints that
  support them ([Ches Martin])

## 1.0.5 - 27 March, 2013

- Fix inability to pass direction param for startup_roles ([Ches Martin])

## 1.0.4 - 25 March, 2013

- Add new user roles and startup roles endpoints; document and test the new "v1"
  version of startup_roles endpoint ([Pedro Freitas])

## 1.0.3 - 10 March, 2013

- Added press endpoint ([Evan Tann])
- Added messages endpoint ([Paul Singh])
- Added paths endpoint ([Ches Martin])
- Established integration test setup for authenticated endpoints.

## 1.0.2 - 30 July, 2012

- Loosen dependency requirements for faraday and multi_json, so we don't
  conflict with newer versions of other API gems like Twitter.
- Added available batch endpoints (users, startups, follows).
- Added jobs endpoints.
- Added search endpoint.
- Filled in a few gaps: startup comments and single activity feed item
  endpoints.
- Integration specs added using VCR, for unauthenticated calls so far.
- Backported several changes from Twitter gem which was our genesis.
- YARD cleanup.

## 1.0.1 - 22 March, 2012

- Doh, we bungled a version number -- no changes.

## 0.1.2 - 22 March, 2012

- Relax Hashie dependency, in particular to avoid dep conflict with
  omniauth-angellist.

[api-activity-feeds]: https://angel.co/api/spec/activity_feeds

[Paul Singh]: https://github.com/paulsingh
[Ches Martin]: https://github.com/ches
[Evan Tann]: https://github.com/egtann
[Pedro Freitas]: https://github.com/pelf
[Rahil Sondhi]: https://github.com/rahilsondhi
[Michael Revell]: https://github.com/MichaelRevell

<!-- vim: set tw=80 :-->

