`import Em from 'ember';`

SVGContainer = Em.Component.extend
  template: Em.Handlebars.compile '<div id="svg-wrapper">{{yield}}</div>'

  svgInit: ->
    @set 'draw', SVG('svg-wrapper')

  didInsertElement: ->
    @svgInit()

`export default SVGContainer;`
