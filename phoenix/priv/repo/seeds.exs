# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EmberPaint.Repo.insert!(%EmberPaint.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

house = EmberPaint.Repo.insert!(%EmberPaint.Drawing{
  title: "A house"
})

# House Itself
EmberPaint.Repo.insert!(%EmberPaint.Shape{
  drawing_id: house.id,
  type: "Rectangle",
  x: 10, y: 90,
  width: 180,
  height: 200,
  fill: "red"
})

# Chimney
EmberPaint.Repo.insert!(%EmberPaint.Shape{
  drawing_id: house.id,
  type: "Rectangle",
  x: 125, y: 0,
  width: 25,
  height: 50,
  fill: "green"
})

# Roof
EmberPaint.Repo.insert!(%EmberPaint.Shape{
  drawing_id: house.id,
  type: "Triangle",
  x: 0, y: 0,
  width: 200,
  height: 100,
  fill: "blue"
})
