import Em from 'ember';

const ShapeEditor = Em.Component.extend({
  actions: {
    save() {
      this.get('shape').save();
    }
  }
});

export default ShapeEditor;
