`import Em from 'ember';`

SVGContainer = Em.Component.extend
  template: Em.Handlebars.compile '<div id="svg-wrapper">{{yield}}</div>'

  svgInit: ->
    @set 'draw', SVG('svg-wrapper').size(500, 500)

  didInsertElement: ->
    @svgInit()

`export default SVGContainer;`
