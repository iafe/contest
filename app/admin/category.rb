# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

ActiveAdmin.register Category do

  menu priority: 7
  
  permit_params :name, :code, :award_id, :submission_file_type, :document_max_number, 
  :max_total_file_size, :description, :rules, :enabled, :accepts_multiple_submissions, :required_format
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:award)
    end
  end
  
  index do
    column :id, sortable: :id do |category|
      link_to category.id, admin_category_path(category)
    end
    column :award, sortable: :award
    column :code
    column :name
    column "Format", :required_format
    column "File Type", :submission_file_type
    column "Doc Max #", :document_max_number
    column "Max Size", :max_total_file_size
    column "Multi-Submit", :accepts_multiple_submissions
    column :enabled
    actions
  end
  
  filter :award
  filter :code, as: :string
  filter :name, as: :string
  filter :submission_file_type, as: :select
  filter :required_format, as: :select
  filter :enabled, as: :select, label: "Enabled?"
  filter :accepts_multiple_submissions, as: :select, label: "Accepts Multiple Submissions?"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :award, required: true
      f.input :name
      f.input :code
      f.input :required_format, as: :select, :collection => ["Digital Only", "Physical Only", "Digital and Physical"]
      f.input :submission_file_type, as: :select, :collection => ["Mixed (PDF and Images)", "Images Only", "Video Only", "URL Link Only", "App Name"]
      f.input :document_max_number
      f.input :max_total_file_size
      f.input :accepts_multiple_submissions, as: :select, required: true
      f.input :description
      f.input :rules
      f.input :enabled, as: :select, required: true
    end
    f.actions
  end

end
