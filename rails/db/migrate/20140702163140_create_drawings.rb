class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :title
      t.timestamps
    end
  end
end
