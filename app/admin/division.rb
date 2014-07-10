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
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
