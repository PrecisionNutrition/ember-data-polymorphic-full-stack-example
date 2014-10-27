`import Em from "ember"`

DrawingRoute = Em.Route.extend
  # Load async shapes
  afterModel: (drawing) -> drawing.get 'shapes'

`export default DrawingRoute`