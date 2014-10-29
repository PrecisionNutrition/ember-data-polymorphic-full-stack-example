`import DS from "ember-data"`
`import mapType from "emberpaint/map-type"`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  pathForType: (type) -> @_super mapType(type)

`export default ApplicationAdapter`
