`import DS from 'ember-data';`

{ attr, hasMany } = DS

Drawing = DS.Model.extend
  title: attr 'string'

  shapes: hasMany 'shape', polymorphic: true, async: true

Drawing.reopenClass
  FIXTURES: [
    { id: 1, title: "A house", shapes: [
        { id: 1, type: 'rectangle' },
        { id: 2, type: 'rectangle' },
        { id: 3, type: 'triangle' }
      ]
    }
  ]

`export default Drawing;`
