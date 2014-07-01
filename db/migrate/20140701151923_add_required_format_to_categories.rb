class AddRequiredFormatToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :required_format, :string
  end
end
