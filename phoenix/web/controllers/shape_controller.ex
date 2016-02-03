require IEx

defmodule EmberPaint.ShapeController do
  use EmberPaint.Web, :controller

  alias EmberPaint.Shape

  plug :adjust_types when action in [:create, :update]
  plug :scrub_params, "shape" when action in [:create, :update]

  def index(conn, _params) do
    shapes = Repo.all(Shape)
    render(conn, "index.json", shapes: shapes)
  end

  defp adjust_types(conn = %Plug.Conn{ params: params }, _) do
    shape_types = ["rectangle", "triangle"]

    # Extract the first known shape key
    { shape_key, shape_params } = params
      |> Dict.take(["rectangle", "triangle"])
      |> Dict.to_list
      |> List.first

    adjusted_shape_params = shape_params |> Dict.put("type", shape_key)
    adjusted_params = params |> Dict.put("shape", adjusted_shape_params)

    # Return the updated conn
    %{ conn | :params => adjusted_params }
  end

  def create(conn, %{"shape" => shape_params}) do
    changeset = Shape.changeset(%Shape{}, shape_params)

    %{ path_info: [shape_type | _] } = conn
    shape_type = Inflex.singularize(shape_type)

    case Repo.insert(changeset) do
      {:ok, shape} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", shape_path(conn, :show, shape))
        |> render("show.json", shape: shape, json_root: shape_type)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(EmberPaint.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    # We need to know which route this came from to render the json root properly
    # (ie: rectangles instead of shapes)
    %{ path_info: [shape_type, _] } = conn

    shape = Repo.get!(Shape, id)
    render(conn, "show.json", json_root: shape_type, shape: shape)
  end

  def update(conn, %{"id" => id, "shape" => shape_params}) do
    shape = Repo.get!(Shape, id)
    changeset = Shape.changeset(shape, shape_params)
    %{ path_info: [shape_type, _] } = conn

    case Repo.update(changeset) do
      {:ok, shape} ->
        render(conn, "show.json", shape: shape, json_root: shape_type )
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(EmberPaint.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shape = Repo.get!(Shape, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(shape)

    send_resp(conn, :no_content, "")
  end
end
