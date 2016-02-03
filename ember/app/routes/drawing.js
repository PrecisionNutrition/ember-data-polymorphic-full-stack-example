import Em from "ember";

var DrawingRoute = Em.Route.extend({
  afterModel: function(drawing) {
    return drawing.get('shapes');
  },

  actions: {
    addShape(shapeType) {
      this.get('store').createRecord(shapeType,{
        drawing: this.modelFor('drawing')
      });
    }
  }
});

export default DrawingRoute;
