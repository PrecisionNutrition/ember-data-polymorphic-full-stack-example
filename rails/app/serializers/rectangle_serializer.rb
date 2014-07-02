class RectangleSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :fill, :width, :height

  has_one :drawing, embed: :ids
end
