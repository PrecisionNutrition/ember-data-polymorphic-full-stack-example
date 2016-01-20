import Em from 'ember';

let svgAttrBinding = function(name) {
  return (function() {
    let svgElement = this.get('svgElement');

    if (!svgElement) {
      return;
    }

    let newValue = this.get("shape").get(name);

    return svgElement[name](newValue);
  }).observes(`shape.${name}`).on('svgRendered');
};

const SVGShape = Em.Component.extend({
  parentDraw: (function() {
    let findDraw = function(view) {
      if (view) {
        return view.get('draw') || findDraw(view.get('parentView'));
      }
    };

    return findDraw(this);
  }).property(),

  createSVGElement: Em.K,

  renderSVG: (function() {
    this.set('svgElement', this.createSVGElement(this.get('parentDraw')));

    return this.trigger('svgRendered');
  }).on('didInsertElement'),

  _x: svgAttrBinding('x'),
  _y: svgAttrBinding('y')
});

SVGShape.svgAttrBinding = svgAttrBinding;

export default SVGShape;
