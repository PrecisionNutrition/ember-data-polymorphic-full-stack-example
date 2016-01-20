import Em from 'ember';

const { computed } = Em;
const { alias } = computed;

const SVGDisplay = Em.Component.extend({
  shapeType: alias('shape.shapeType'),

  shapeComponent: computed('shapeType', function() {
    return `svg-${this.get('shapeType')}`;
  })
});

export default SVGDisplay;
