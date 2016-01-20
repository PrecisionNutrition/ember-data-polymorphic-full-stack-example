import Em from 'ember';
import SVGShape from 'emberpaint/components/svg-shape';

const { computed } = Em;

const SVGTriangle = SVGShape.extend({
  tagName: 'polygon',

  attributeBindings: ['points'],

  points: computed('shape.x', 'shape.y', 'shape.width', 'shape.height', function() {
    let x = Number(this.get('shape.x'));
    let y = Number(this.get('shape.y'));
    let width = Number(this.get('shape.width'));
    let height = Number(this.get('shape.height'));

    let plot = [[x + (0.5 * width), y], [x + width, y + height], [x, y + height]];

    return plot.map(function(x) { return x.join(","); }).join(" ");
  })
});

export default SVGTriangle;
