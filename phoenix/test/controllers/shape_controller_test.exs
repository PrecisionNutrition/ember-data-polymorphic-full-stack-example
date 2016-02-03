defmodule EmberPaint.ShapeControllerTest do
  use EmberPaint.ConnCase

  alias EmberPaint.Shape
  @valid_attrs %{fill: "some content", height: 42, type: "some content", width: 42, x: 42, y: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, shape_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    shape = Repo.insert! %Shape{}
    conn = get conn, shape_path(conn, :show, shape)
    assert json_response(conn, 200)["data"] == %{"id" => shape.id,
      "type" => shape.type,
      "x" => shape.x,
      "y" => shape.y,
      "width" => shape.width,
      "height" => shape.height,
      "fill" => shape.fill,
      "drawing" => shape.drawing}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, shape_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, shape_path(conn, :create), shape: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Shape, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, shape_path(conn, :create), shape: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    shape = Repo.insert! %Shape{}
    conn = put conn, shape_path(conn, :update, shape), shape: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Shape, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    shape = Repo.insert! %Shape{}
    conn = put conn, shape_path(conn, :update, shape), shape: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    shape = Repo.insert! %Shape{}
    conn = delete conn, shape_path(conn, :delete, shape)
    assert response(conn, 204)
    refute Repo.get(Shape, shape.id)
  end
end
