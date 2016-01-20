import Em from "ember";

var DrawingRoute = Em.Route.extend({
  afterModel: function(drawing) {
    return this.store.findAll('shape');
  }
});

export default DrawingRoute;
