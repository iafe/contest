class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :code
      t.integer :award_id
      t.integer :document_max_number
      t.integer :photo_max_number
      t.integer :video_max_number
      t.integer :max_total_file_size
      t.text :description
      t.text :rules
      t.boolean :enabled

      t.timestamps
	  t.references :award
    end
  end
end
