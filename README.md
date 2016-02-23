ember-data-polymorphic-full-stack-example
=========================================

An example app that ties an ember-data front-end to a Rails backend with a polymorphic API

There is also a Elixir/Phoenix implementation of the back-end for comparison purposes.

Try them both and see which you prefer!

I'm glossing over the bundle install, npm yadayada, brew install, etc stuff below. But basically:

To run, go to ember dir and:

    ember server --port 4210 --live-reload-port 23131

Then for rails backend:

    cd rails
    rake db:create db:migrate
    rails s

Alternatively, for the phoenix backend:

    iex -S mix phoenix.server

Finally, in your browser go to 

    http://localhost:4200/drawings/1
