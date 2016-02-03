defmodule EmberPaint.DrawingControllerTest do
  use EmberPaint.ConnCase

  alias EmberPaint.Drawing
  @valid_attrs %{title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, drawing_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    drawing = Repo.insert! %Drawing{}
    conn = get conn, drawing_path(conn, :show, drawing)
    assert json_response(conn, 200)["data"] == %{"id" => drawing.id,
      "title" => drawing.title}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, drawing_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, drawing_path(conn, :create), drawing: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Drawing, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, drawing_path(conn, :create), drawing: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    drawing = Repo.insert! %Drawing{}
    conn = put conn, drawing_path(conn, :update, drawing), drawing: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Drawing, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    drawing = Repo.insert! %Drawing{}
    conn = put conn, drawing_path(conn, :update, drawing), drawing: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    drawing = Repo.insert! %Drawing{}
    conn = delete conn, drawing_path(conn, :delete, drawing)
    assert response(conn, 204)
    refute Repo.get(Drawing, drawing.id)
  end
end
