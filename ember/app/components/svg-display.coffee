`import Em from 'ember';`

SVGDisplay = Em.Component.extend
  layout: Em.Handlebars.compile '{{render-component "shapeComponent" shapeBinding="shape"}}'
  shapeType: Em.computed.alias 'shape.shapeType'

  shapeComponent: Em.computed 'shapeType', ->    
    "svg-#{@get 'shapeType'}"

`export default SVGDisplay;`
