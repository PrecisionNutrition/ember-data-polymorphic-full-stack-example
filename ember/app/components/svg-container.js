import Em from 'ember';

const SVGContainer = Em.Component.extend({
  svgInit() {
    return this.set('draw', SVG('svg-wrapper').size(500, 500));
  },

  didInsertElement() {
    return this.svgInit();
  }
});

export default SVGContainer;
