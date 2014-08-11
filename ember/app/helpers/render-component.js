import Ember from 'ember';

export default Ember.Handlebars.makeBoundHelper(function(componentPath, options) {
  var component = Ember.Handlebars.get(this, componentPath, options),
      helper = Ember.Handlebars.resolveHelper(options.data.view.container, component);

  helper.call(this, options);
});
