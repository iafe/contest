class AddIndexToOrganizationNameState < ActiveRecord::Migration
  def change
    add_index :organizations, [:name, :state_province], unique: true
  end
end
