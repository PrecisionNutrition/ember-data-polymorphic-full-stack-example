`import SVGShape from 'emberpaint/components/svg-shape';`

SVGRect = SVGShape.extend
  createSVGElement: (draw) -> draw.rect()

  _fill:    SVGShape.svgAttrBinding 'fill'
  _width:   SVGShape.svgAttrBinding 'width'
  _height:  SVGShape.svgAttrBinding 'height'

`export default SVGRect;`
