class DrawingSerializer < ActiveModel::Serializer
  attributes :id, :title, :shapes

  def shapes
    object.shapes.map { |e| { id: e.id, type: e.type } }
  end
end
