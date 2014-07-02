`import DS from 'ember-data';`

{ attr, hasMany } = DS

Drawing = DS.Model.extend
  title: attr 'string'

  shapes: hasMany 'shape', polymorphic: true, async: true

`export default Drawing;`
