`import Ember from 'ember';`

Router = Ember.Router.extend location: EmberpaintENV.locationType

Router.map ->
  @resource 'drawing', path: '/drawings/:drawing_id'

`export default Router;`
