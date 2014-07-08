house = Drawing.create! title: "A house"
# House Itself
Rectangle.create!(
  drawing: house,
  x: 10, y: 90,
  width: '180',
  height: '200',
  fill: 'red'
)

# Chimney
Rectangle.create!(
  drawing: house,
  x: 125, y: 0,
  width: '25',
  height: '50',
  fill: 'green'
)

# Roof
Triangle.create!(
  drawing: house,
  x: 0, y: 0,
  width: '200',
  height: '100',
  fill: 'blue'
)
