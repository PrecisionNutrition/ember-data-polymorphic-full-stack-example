import DS from 'ember-data';
import Em from 'ember';

const { attr, belongsTo } = DS;
const { computed } = Em;


const Shape = DS.Model.extend({
  x: attr('number', { defaultValue: 0 }),
  y: attr('number', { defaultValue: 0 }),
  fill: attr('string', { defaultValue: 'black' }),
  width: attr('number', { defaultValue: 50 }),
  height: attr('number', { defaultValue: 50 }),

  shapeType: computed(function() {
    return this.constructor.modelName;
  }),

  drawing: belongsTo('drawing', {
    inverse: 'shapes'
  })
});

export default Shape;
