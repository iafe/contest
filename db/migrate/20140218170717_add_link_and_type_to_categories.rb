class AddLinkAndTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :link_max_number, :integer
    add_column :categories, :submission_file_type, :string
  end
end
