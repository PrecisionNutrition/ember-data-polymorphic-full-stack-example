class Drawing < ActiveRecord::Base
  has_many :shapes

  def rectangles
    shapes.where type: 'Rectangle'
  end

  def triangles
    shapes.where type: 'Triangle'
  end
end
