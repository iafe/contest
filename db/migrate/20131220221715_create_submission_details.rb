class CreateSubmissionDetails < ActiveRecord::Migration
  def change
    create_table :submission_details do |t|
      t.integer :submission_id
      t.string :file_url

      t.timestamps
	  t.references :submission
    end
  end
end
