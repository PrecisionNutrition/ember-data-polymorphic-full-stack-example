ember-data-polymorphic-full-stack-example
=========================================

An example app that ties an ember-data front-end to a Rails backend with a polymorphic API

To setup:

cd rails
rake db:create db:migrate
rails s

ember server --proxy http://localhost:3000/

And go to http://localhost:4200/drawings/1
