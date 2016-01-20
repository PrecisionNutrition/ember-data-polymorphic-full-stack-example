import Em from 'ember';

const { computed } = Em;
const { alias } = computed;

const SVGShape = Em.Component.extend({
  tagName: '',

  attributeBindings: ['x', 'y', 'style'],

  x: alias('shape.x'),
  y: alias('shape.y'),

  style: computed('shape.fill', function() {
    let fill = this.get('shape.fill');

    return `fill:${fill}`;
  }),
});

export default SVGShape;
