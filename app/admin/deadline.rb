# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

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
    actions
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
  
end
