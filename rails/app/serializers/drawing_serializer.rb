class DrawingSerializer < ActiveModel::Serializer
  attributes :id, :title, :shapes

  def shapes
    object.shapes.map { |e| { id: e.id, type: e.type } }
  end

  # has_many :triangles,  include: true, embed: :ids
  # has_many :rectangles, include: true, embed: :ids
end
