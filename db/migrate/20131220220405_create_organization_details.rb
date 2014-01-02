class CreateOrganizationDetails < ActiveRecord::Migration
  def change
    create_table :organization_details do |t|
      t.integer :organization_id
      t.date :fair_start_date
      t.date :fair_end_date
      t.integer :total_attendance

      t.timestamps
	  t.references :organization
    end
  end
end
