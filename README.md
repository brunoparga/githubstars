# brunoparga's githubstars

My submission to Brainn's developer challenge

# Known issues

## tag recommendation

When the user changes focus between the several tag adding forms, they switch
from gray to black and from having the suggested tag to being empty for typing.
However, submitting a tag that is different from the suggestion does not work,
because the form submission triggers the blur/focusout event, which in turn
switches the form value to the initial suggestion and submits that.

## unnecessary assignmnent

The `RepositoriesController` `search` action unnecessarily assigns the
`@searched_user` instance variable, instead of both this action and the view
just relying on the `searched_user` method from `ApplicationController`. This is
because I could not figure out how to call this method from the view spec.

# README

--TODO--

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
