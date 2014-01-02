class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :division_id

      t.timestamps
	  t.references :user
	  t.references :category
	  t.references :division
    end
  end
end
