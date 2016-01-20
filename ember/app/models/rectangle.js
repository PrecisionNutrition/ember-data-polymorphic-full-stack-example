import DS from 'ember-data';
import Shape from 'emberpaint/models/shape';

const attr = DS.attr;

const Rectangle = Shape.extend({
  width: attr('string'),
  height: attr('string'),
  fill: attr('string')
});

export default Rectangle;