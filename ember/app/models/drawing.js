import DS from 'ember-data';

const { attr, hasMany } = DS;

const Drawing = DS.Model.extend({
  title: attr('string'),

  shapes: hasMany('shape', {
    polymorphic: true,
    async: true,
    inverse: 'drawing'
  })
});

export default Drawing;
