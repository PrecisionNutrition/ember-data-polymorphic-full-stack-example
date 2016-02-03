class RectangleSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :fill, :width, :height, :type

  has_one :drawing, embed: :ids
end
