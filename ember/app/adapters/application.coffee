`import DS from "ember-data"`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  pathForType: (type) -> 
    if type is 'quadrangle'
      'rectangles'
    else
      @_super(type)

`export default ApplicationAdapter`