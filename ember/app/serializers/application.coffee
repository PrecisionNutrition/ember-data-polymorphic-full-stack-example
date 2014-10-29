`import DS from "ember-data"`
`import mapType from "emberpaint/map-type"`

ApplicationSerializer = DS.ActiveModelSerializer.extend
  typeForRoot: (key) -> @_super mapType(key)

  serializeIntoHash: (data, type, record, options) ->
    typeKey = type.typeKey
    key = mapType(typeKey)
    data[key] = @serialize(record, options)

`export default ApplicationSerializer`
