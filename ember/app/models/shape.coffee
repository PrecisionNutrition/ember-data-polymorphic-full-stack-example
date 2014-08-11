`import DS from 'ember-data';`

attr = DS.attr

Shape = DS.Model.extend
  x: attr 'number'
  y: attr 'number'

  shapeType: (-> @constructor.toString() ).property()

`export default Shape;`
