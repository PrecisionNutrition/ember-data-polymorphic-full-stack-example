class CreateShapes < ActiveRecord::Migration
  def change
    create_table :shapes do |t|
      t.string :type
      t.references :drawing

      # Common to all
      t.integer :x
      t.integer :y

      # For rectangles
      t.string  :fill
      t.string  :width
      t.string  :height
    end
  end
end
