class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :user_id
      t.integer :submission_id
      t.integer :total_score
      t.text :comments
      t.boolean :disqualify

      t.timestamps
	  t.references :user
	  t.references :submission
    end
  end
end
