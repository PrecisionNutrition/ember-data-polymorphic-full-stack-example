`import DS from 'ember-data';`
`import Shape from 'emberpaint/models/shape';`

attr = DS.attr

Triangle = Shape.extend
  width:  attr 'string'
  height: attr 'string'
  fill:   attr 'string'

Triangle.reopenClass
  FIXTURES: [
    { id: 3, x: 0, y: 0, width: 200, height: 100, fill: 'blue' }
  ]

`export default Triangle;`
