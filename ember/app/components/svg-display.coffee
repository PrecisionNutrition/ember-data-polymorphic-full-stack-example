`import Em from 'ember';`

SVGDisplay = Em.Component.extend
  template: Em.Handlebars.compile '{{render-component "shapeComponent" shape=shape}}'
  shapeType: Em.computed.alias 'shape.shapeType'

  shapeComponent: (->
    switch @get('shapeType')
      when "emberpaint@model:rectangle:" then "svg-rect"
      when "emberpaint@model:triangle:" then "svg-triangle"
      else
        throw "Unknown shape type"
  ).property 'shapeType'

`export default SVGDisplay;`