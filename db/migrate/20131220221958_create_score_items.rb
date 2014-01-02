class CreateScoreItems < ActiveRecord::Migration
  def change
    create_table :score_items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :max_points

      t.timestamps
	  t.references :category
    end
  end
end
