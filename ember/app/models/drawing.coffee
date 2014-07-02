`import DS from 'ember-data';`

attr = DS.attr

Drawing = DS.Model.extend({
  title: attr 'string'
});

`export default Drawing;`
