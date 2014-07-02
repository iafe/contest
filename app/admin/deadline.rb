ActiveAdmin.register Deadline do

  menu priority: 14
  
  permit_params :deadline, :actual_deadline
  
  index do
    column :id, sortable: :id do |deadline|
      link_to deadline.id, admin_deadline_path(deadline)
    end
    column :deadline
    column :actual_deadline
    column "Created", :created_at, sortable: :created_at do |deadline|
      deadline.created_at.strftime("%m/%d/%Y")
    end
    column "Updated", :updated_at, sortable: :updated_at do |deadline|
      deadline.updated_at.strftime("%m/%d/%Y")
    end
    default_actions
  end
  
  filter :deadline
  filter :actual_deadline
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :deadline
      f.input :actual_deadline
    end
    f.actions
  end
  
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
