`import SVGShape from 'emberpaint/components/svg-shape';`

SVGTriangle = SVGShape.extend
  createSVGElement: (draw) -> draw.polygon()

  _fill:    SVGShape.svgAttrBinding 'fill'

  plot: (->
    x = Number(@get 'shape.x')
    y = Number(@get 'shape.y')
    width = Number(@get 'shape.width')
    height = Number(@get 'shape.height')

    plot = [
      [x + (0.5 * width), y]
      [x + width, y + height],
      [x, y + height]
    ]
    plot
  ).property 'shape.x', 'shape.y', 'shape.width', 'shape.height'

  _plot: (->
    svgElement = @get 'svgElement'
    return unless svgElement

    svgElement.plot(@get 'plot')
  ).observes('plot').on 'svgRendered'

`export default SVGTriangle;`
