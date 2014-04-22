class RemovePhotoVideoLinkFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :photo_max_number, :integer
	  remove_column :categories, :video_max_number, :integer
	  remove_column :categories, :link_max_number, :integer
  end
end
