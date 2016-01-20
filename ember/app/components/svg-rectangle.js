import SVGShape from 'emberpaint/components/svg-shape';

const { computed } = Em;
const { alias } = computed;

const SVGRectangle = SVGShape.extend({
  tagName: 'rect',

  attributeBindings: ['width', 'height'],

  width: alias('shape.width'),
  height: alias('shape.height')
});

export default SVGRectangle;
