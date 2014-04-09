class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :submission_id
      t.decimal :total_score, precision: 5, scale: 2
      t.text :comments
      t.boolean :disqualify

      t.timestamps
	  t.references :user
	  t.references :submission
    end
  end
end
