defmodule EmberPaint.Repo.Migrations.CreateShape do
  use Ecto.Migration

  def change do
    create table(:shapes) do
      add :type, :string
      add :x, :integer
      add :y, :integer
      add :width, :integer
      add :height, :integer
      add :fill, :string
      add :drawing_id, references(:drawings, on_delete: :nothing)

      timestamps
    end
    create index(:shapes, [:drawing_id])

  end
end
