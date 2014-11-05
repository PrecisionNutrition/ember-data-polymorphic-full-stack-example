`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend location: config.locationType

Router.map ->
  @resource 'drawing', path: '/drawings/:drawing_id'

`export default Router`
