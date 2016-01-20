import SVGShape from 'emberpaint/components/svg-shape';

const SVGTriangle = SVGShape.extend({
  createSVGElement(draw) {
    return draw.polygon();
  },

  _fill: SVGShape.svgAttrBinding('fill'),

  plot: (function() {
    let x = Number(this.get('shape.x'));
    let y = Number(this.get('shape.y'));
    let width = Number(this.get('shape.width'));
    let height = Number(this.get('shape.height'));
    let plot = [[x + (0.5 * width), y], [x + width, y + height], [x, y + height]];

    return plot;
  }).property('shape.x', 'shape.y', 'shape.width', 'shape.height'),

  _plot: (function() {
    let svgElement = this.get('svgElement');

    if (!svgElement) {
      return;
    }

    return svgElement.plot(this.get('plot'));
  }).observes('plot').on('svgRendered')
});

export default SVGTriangle;
