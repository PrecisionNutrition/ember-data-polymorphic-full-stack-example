`import Em from 'ember';`

svgAttrBinding = (name) ->
  (->
    svgElement = @get 'svgElement'
    return unless svgElement

    newValue = @get("shape").get(name)
    svgElement[name](newValue)
  ).observes("shape.#{name}").on 'svgRendered'

SVGShape = Em.Component.extend
  parentDraw: (->
    findDraw = (view) ->
      if view
        view.get('draw') or findDraw view.get('parentView')

    findDraw @
  ).property()

  createSVGElement: Em.K

  renderSVG: (->
    @set 'svgElement', @createSVGElement(@get('parentDraw'))
    @trigger 'svgRendered'
  ).on 'didInsertElement'

  _x: svgAttrBinding 'x'
  _y: svgAttrBinding 'y'

SVGShape.svgAttrBinding = svgAttrBinding

`export default SVGShape;`
