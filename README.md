# brunoparga's githubstars

This is my submission to Brainn's developer challenge.

## Installation instructions

The application runs on Ruby 2.5.3 and Rails 5.2.2. Use your Ruby version
manager to install the right Ruby, then clone this repository locally. Then
start the PostgreSQL database:

```
$ rails db:create
```

## Using the API

Let's test the API first. It lives in a separate branch from the Web app,
because of how authentication is handled. So we need to check it out:

```
$ git checkout api
```

Next, some configuration is needed:

```
$ bundle install
$ yarn install
$ rails db:migrate
```

Now that our API app is set up, let's test it. The documentation is available
at `./github_stars_API.apib`; to automatically test from that specification,
just run:

```
$ dredd
```

Each of the four routes should work as described in the challenge.

## Lauching the Web version

The Web version lives in the `master` branch:

```
$ git checkout master
$ rails db:reset
$ bundle install
$ rails server
```

Fire up a browser and navigate to `http://localhost:3000`.

## Usage

### Listing repositories

Enter a Github username to get a list of the repositories they have starred. A
list of tags the user has applied to each repository is also available.

### Managing tags

A user can add and remove tags on their own repository. To enforce this, signing
in with Github is required; the sign-in link is on the navbar. The system manages
which repositories have each tag on a per-user basis; that means that user A
tagging the repository X with the tag "interesting" won't affect user B's tags
of repository X. B can still see that A applied the tag.

### Searching by tag

Anyone can filter repositories by their tags using the search box on top of the
repository list. The search term might be a prefix, infix or suffix of the tag
name, or the entire name: searching for `"tes"` will match `"testing"`, `"doctest"`
and `"kubernetes"`, as long as those tags exist in the database.

Searching only one term shows all repositories with any matching tags. Multiple
term search is generally equivalent to the union of the results of each
individual term; searching for `"ruby doc"` will return the same repositories as
`"ruby"`, plus those for `"doc"` (meaning, this includes `"docker"` and
`"documentation"`).

However, if each of the terms exactly matches the name of an existing tag, then
only repositories with all the included tags will be displayed. This means that
the query `"javascript front-end framework"` will only return repositories tagged
with all three of the `"javascript"`, `"front-end"`, and `"framework"` tags, while
the query `"javascr front framew"` would include repositories with *any* of
these tags, according to the general search strategy.

### Tag recommendations

The first priority in recommendation goes to the most commonly applied tag in
that repository. If the user already has that, priority then goes to the tag
representing the language of the repository (or `"documentation"` if the language
is not defined on Github).

The fallback recommendation is the "favorite" tag; it is last in priority and
it is the only one that gets recommended even if already applied to that
repository.

## Linter

The Ruby code was linted with Rubocop. The `rubocop.yml` file is at the root
directory. Running `rubocop -a` should return no offenses.

## Tests

Run the test suite with:

```
$ rspec
```

There are some tests that are known to fail in the current version of the
application; see "Known Issues", below.

## Known issues / potential improvements

### Unnecessary assignmnent

The `RepositoriesController#search` action unnecessarily assigns the
`@searched_user` instance variable, instead of both this action and the view
just relying on the `searched_user` method from `ApplicationController`. This is
because I could not figure out how to call this method from the view spec.

### Failing view tests

Also in the vein of "writing code I don't yet know how to test", the main view
makes use of a helper method from the `ApplicationController`. RSpec cannot
find this method (and I haven't figured out how to stub it). This is in part a
[known issue with RSpec](https://github.com/rspec/rspec-rails/issues/1076).

### Failing system tests

The problem here is that I don't know how to set up the test as if the user was
authenticated. This omits the forms the test would need to fill in.

### Shoulda_matchers gem known bug

When writing the test for RepositoryTag I ran into a
[known issue](https://github.com/thoughtbot/shoulda-matchers/issues/814) with
the shoulda_matchers gem: it does not handle well a scoped uniqueness validation.

### Tag recommendation JavaScript

When the user changes focus between the several tag adding forms, they switch
from gray to black and from having the suggested tag to being empty for typing.
However, submitting a tag that is different from the suggestion does not work,
because the form submission triggers the blur/focusout event, which in turn
switches the form value to the initial suggestion and submits that.
