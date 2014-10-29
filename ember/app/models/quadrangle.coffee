`import DS from 'ember-data';`
`import Shape from 'emberpaint/models/shape';`

{ attr } = DS

Quadrangle = Shape.extend
  width:  attr 'string'
  height: attr 'string'
  fill:   attr 'string'

`export default Quadrangle;`
