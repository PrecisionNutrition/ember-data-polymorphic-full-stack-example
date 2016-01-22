import DS from 'ember-data';

const { attr, hasMany } = DS;

const Drawing = DS.Model.extend({
  title: attr('string'),

  shapes: hasMany('shape', { polymorphic: true }),

  height: 500,
  width: 500
});

export default Drawing;
