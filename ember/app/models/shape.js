import DS from 'ember-data';
import Em from 'ember';

const { attr, belongsTo } = DS;
const { computed } = Em;


const Shape = DS.Model.extend({
  x: attr('number'),
  y: attr('number'),

  shapeType: computed(function() {
    return this.constructor.modelName;
  }),

  drawing: belongsTo('drawing', {
    inverse: 'shapes'
  })
});

export default Shape;
