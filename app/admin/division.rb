# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

ActiveAdmin.register Division do

  menu priority: 5
  
  permit_params :name, :division_smallest, :division_largest, :description
  
  index do
    column :id, sortable: :id do |division|
      link_to division.id, admin_division_path(division)
    end
    column :name
    column :division_smallest
    column :division_largest
    column :description
    column "Created", :created_at, sortable: :created_at do |division|
      division.created_at.strftime("%m/%d/%Y")
    end
    actions
  end
  
  filter :name
  filter :division_smallest
  filter :division_largest
  filter :created_at
  filter :updated_at
  
end
