import SVGShape from 'emberpaint/components/svg-shape';

const SVGRectangle = SVGShape.extend({
  createSVGElement(draw) {
    return draw.rect();
  },

  _fill: SVGShape.svgAttrBinding('fill'),
  _width: SVGShape.svgAttrBinding('width'),
  _height: SVGShape.svgAttrBinding('height')
});

export default SVGRectangle;
