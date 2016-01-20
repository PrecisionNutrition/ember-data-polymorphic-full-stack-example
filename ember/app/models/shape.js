import DS from 'ember-data';
import Em from 'ember';

const { attr, hasMany, belongsTo } = DS;
const { computed } = Em;


const Shape = DS.Model.extend({
  x: attr('number'),
  y: attr('number'),

  shapeType: computed(function() {
    return this.constructor.typeKey;
  }),

  drawing: belongsTo('drawing', {
    inverse: 'shapes'
  })
});

export default Shape;
