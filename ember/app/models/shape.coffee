`import DS from 'ember-data'`
`import Em from 'ember'`

{ attr, belongsTo } = DS

Shape = DS.Model.extend
  x: attr 'number'
  y: attr 'number'

  shapeType: Em.computed -> @constructor.typeKey
  
  drawing: belongsTo 'drawing', inverse: 'shapes'

`export default Shape`
