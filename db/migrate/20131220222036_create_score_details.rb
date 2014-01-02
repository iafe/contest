class CreateScoreDetails < ActiveRecord::Migration
  def change
    create_table :score_details do |t|
      t.integer :score_id
      t.integer :points
      t.integer :score_item_id

      t.timestamps
	  t.references :score
	  t.references :score_item
    end
  end
end
