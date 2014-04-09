class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :category_id
      t.integer :user_id
      t.integer :organization_id
      t.integer :division_id
      t.integer :contest_year
      t.text :notes
      t.string :status
      t.boolean :physical_version_received
      t.boolean :digital_version_received
      t.boolean :disqualify

      t.timestamps
	  t.references :category
	  t.references :user
	  t.references :organization
	  t.references :division
    end
  end
end
