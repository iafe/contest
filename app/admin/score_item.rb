# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

ActiveAdmin.register ScoreItem do

  menu priority: 8
  
  permit_params :name, :description, :category_id, :max_points
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(category: :award)
    end
  end
  
  index do
    column :id, sortable: :id do |score_item|
      link_to score_item.id, admin_score_item_path(score_item)
    end
    column :category
    column :name
    column :max_points
    column "Created", :created_at, sortable: :created_at do |score_item|
      score_item.created_at.strftime("%m/%d/%Y")
    end
    column "Updated", :updated_at, sortable: :updated_at do |score_item|
      score_item.updated_at.strftime("%m/%d/%Y")
    end
    actions
  end
  
  filter :category_name, as: :string
  filter :name
  filter :max_points
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :category_id, :label => 'Category', :as => :select, required: true, :collection => Category.where(enabled: true).map{|c| ["#{c.award.name} #{c.code}: #{c.name}", c.id]}
      f.input :name
      f.input :description
      f.input :max_points
    end
    f.actions
  end
  
end
