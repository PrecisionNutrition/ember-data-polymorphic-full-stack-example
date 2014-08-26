`import DS from 'ember-data';`
`import Shape from 'emberpaint/models/shape';`

attr = DS.attr

Rectangle = Shape.extend
  width:  attr 'string'
  height: attr 'string'
  fill:   attr 'string'

Rectangle.reopenClass
  FIXTURES: [
    { id: 1, x: 0, y: 0, width: 200, height: 100, fill: 'red' },
    { id: 2, x: 0, y: 0, width: 50, height: 50, fill: 'green' }
  ]

`export default Rectangle;`
