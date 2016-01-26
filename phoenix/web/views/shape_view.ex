defmodule EmberPaint.ShapeView do
  use EmberPaint.Web, :view

  def render("index.json", %{json_root: json_root, shapes: shapes}) do
    %{json_root => render_many(shapes, EmberPaint.ShapeView, "shape.json")}
  end

  # Ember is expecting the root to be the type name, hence passing along the root like this
  def render("show.json", %{json_root: json_root, shape: shape}) do
    %{json_root => render_one(shape, EmberPaint.ShapeView, "shape.json")}
  end

  def render("shape.json", %{shape: shape}) do
    %{id: shape.id,
      type: shape.type,
      x: shape.x,
      y: shape.y,
      width: shape.width,
      height: shape.height,
      fill: shape.fill,
      drawing_id: shape.drawing_id}
  end
end
