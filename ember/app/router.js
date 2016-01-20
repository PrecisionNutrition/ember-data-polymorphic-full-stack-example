import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  return this.route('drawing', { path: '/drawings/:drawing_id' });
});

export default Router;
