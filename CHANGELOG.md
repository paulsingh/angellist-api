## Master

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


[Paul Singh]: https://github.com/paulsingh
[Ches Martin]: https://github.com/ches
[Evan Tann]: https://github.com/egtann
[Pedro Freitas]: https://github.com/pelf

<!-- vim: set tw=80 :-->

