typeMap =
  quadrangle: 'rectangle'
  rectangle: 'quadrangle'

mapType = (key) ->
  typeMap[key.underscore()] || key

`export default mapType`
