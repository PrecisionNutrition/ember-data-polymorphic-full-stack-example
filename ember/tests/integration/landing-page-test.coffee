`import startApp from 'emberpaint/tests/helpers/start-app';`

App = undefined

module 'Integration - Landing Page',
  setup:    -> App = startApp()
  teardown: -> Ember.run App, 'destroy'

test 'Should display emberpaint interface', ->
  visit('/').then ->
    equal find('h2#title').text(), 'EmberPaint'
