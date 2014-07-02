`import DS from 'ember-data';`

attr = DS.attr

Rectangle = DS.Model.extend({
  width:  attr 'number'
  height: attr 'number'
  fill:   attr 'string'
});

`export default Rectangle;`
