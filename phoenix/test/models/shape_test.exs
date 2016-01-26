defmodule EmberPaint.ShapeTest do
  use EmberPaint.ModelCase

  alias EmberPaint.Shape

  @valid_attrs %{fill: "some content", height: 42, type: "some content", width: 42, x: 42, y: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Shape.changeset(%Shape{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Shape.changeset(%Shape{}, @invalid_attrs)
    refute changeset.valid?
  end
end
