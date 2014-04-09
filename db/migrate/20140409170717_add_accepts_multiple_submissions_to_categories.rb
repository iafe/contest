class AddAcceptsMultipleSubmissionsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :accepts_multiple_submissions, :boolean
  end
end
