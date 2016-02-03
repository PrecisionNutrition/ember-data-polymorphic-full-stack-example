defmodule EmberPaint.DrawingController do
  use EmberPaint.Web, :controller

  alias EmberPaint.Drawing

  plug :scrub_params, "drawing" when action in [:create, :update]

  def index(conn, _params) do
    drawings = Drawing |> Repo.all |> Repo.preload(:shapes)
    render(conn, "index.json", drawings: drawings)
  end

  def create(conn, %{"drawing" => drawing_params}) do
    changeset = Drawing.changeset(%Drawing{}, drawing_params)

    case Repo.insert(changeset) do
      {:ok, drawing} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", drawing_path(conn, :show, drawing))
        |> render("show.json", drawing: drawing)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(EmberPaint.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drawing = Drawing |> Repo.get!(id) |> Repo.preload(:shapes)
    render(conn, "show.json", drawing: drawing)
  end

  def update(conn, %{"id" => id, "drawing" => drawing_params}) do
    drawing = Repo.get!(Drawing, id)
    changeset = Drawing.changeset(drawing, drawing_params)

    case Repo.update(changeset) do
      {:ok, drawing} ->
        render(conn, "show.json", drawing: drawing)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(EmberPaint.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drawing = Repo.get!(Drawing, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(drawing)

    send_resp(conn, :no_content, "")
  end
end
