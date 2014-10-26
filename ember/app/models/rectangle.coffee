`import DS from 'ember-data';`
`import Shape from 'emberpaint/models/shape';`

{ attr } = DS

Rectangle = Shape.extend
  width:  attr 'string'
  height: attr 'string'
  fill:   attr 'string'

`export default Rectangle;`
