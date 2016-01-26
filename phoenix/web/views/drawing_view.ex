defmodule EmberPaint.DrawingView do
  use EmberPaint.Web, :view

  def render("index.json", %{drawings: drawings}) do
    %{drawings: render_many(drawings, EmberPaint.DrawingView, "drawing.json")}
  end

  def render("show.json", %{drawing: drawing}) do
    %{drawing: render_one(drawing, EmberPaint.DrawingView, "drawing.json")}
  end

  def render("drawing.json", %{drawing: drawing}) do
    %{id: drawing.id,
      title: drawing.title,
      shapes: drawing.shapes |> Enum.map(&(%{id: &1.id, type: &1.type})) }
  end
end
