# brunoparga's githubstars

This is my submission to Brainn's developer challenge.

## Installation instructions

First of all, clone the repository locally. Then start the database:

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
$ rails db:migrate
$ bundle install
$ rails server
```

Fire up a browser and navigate to `http://localhost:3000`.

## Usage

Enter a Github username to get a list of the repositories they have starred. A
list of tags the user has applied to each repository is also available;
furthermore, a user can add and remove tags, but only to their own repository.
To enforce this, signing in with Github is required; the sign-in link is on the
navbar.

Regardless of login, anyone can filter repositories by their tags using the
search box on top of the repository list. Searching only one term shows all
repositories with any tags that match that term; this is also the behavior
for multiple terms, with one exception.

If each of the terms exactly matches the name of an existing tag, then only
repositories with all the included tags will be displayed. This means that the
query `"javascript front-end framework"` will only return repositories tagged
with all three of the `"javascript"`, `front-end`, and `framework` tags, while
the query `"javascr front framew"` would include repositories with *any* of
these tags, according to the general search strategy.

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
