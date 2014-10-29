`import DS from "ember-data"`

ApplicationSerializer = DS.ActiveModelSerializer.extend
  typeForRoot: (key) ->
    if key.toUpperCase() is 'RECTANGLE'
      'quadrangle'
    else
      @_super(key)

  serializeIntoHash: (data, type, record, options) ->
    if type.typeKey is 'quadrangle'
      data['rectangle'] = @serialize(record, options)
    else
      @_super(data, type, record, options)

`export default ApplicationSerializer`