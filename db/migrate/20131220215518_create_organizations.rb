class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :primary_contact
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state_province
      t.string :country
      t.string :zip_code
      t.string :phone
      t.boolean :fair
      t.boolean :enabled

      t.timestamps
    end
  end
end
