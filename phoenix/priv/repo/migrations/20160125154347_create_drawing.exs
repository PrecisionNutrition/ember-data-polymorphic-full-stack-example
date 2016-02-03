defmodule EmberPaint.Repo.Migrations.CreateDrawing do
  use Ecto.Migration

  def change do
    create table(:drawings) do
      add :title, :string

      timestamps
    end

  end
end
