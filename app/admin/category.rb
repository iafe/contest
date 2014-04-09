ActiveAdmin.register Category do

  menu priority: 7
  
  permit_params :name, :code, :award_id, :submission_file_type, :document_max_number, :photo_max_number, 
      :video_max_number, :link_max_number, :max_total_file_size, :description, :rules, :enabled, :accepts_multiple_submissions
  
  index do
    column :id, sortable: :id do |category|
      link_to category.id, admin_category_path(category)
    end
    column :award, sortable: :award
    column :code
    column :name
    column "File Type", :submission_file_type
    column "Doc Max", :document_max_number
    column "Photo Max", :photo_max_number
    column "Video Max", :video_max_number
    column "Link Max", :link_max_number
    column "Max Size", :max_total_file_size
    column "Multi-Submit", :accepts_multiple_submissions
    column :enabled
  end
  
  filter :award
  filter :code, as: :string
  filter :name, as: :string
  filter :submission_file_type, as: :select
  filter :enabled, as: :select, label: "Enabled?"
  filter :accepts_multiple_submissions, as: :select, label: "Accepts Multiple Submissions?"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :award
      f.input :name
      f.input :code
      f.input :submission_file_type, as: :select, :collection => ["Mixed (PDF and Images)", "Images Only", "Video Only", "URL Link Only"]
      f.input :document_max_number
      f.input :photo_max_number
      f.input :video_max_number
      f.input :link_max_number
      f.input :max_total_file_size
      f.input :accepts_multiple_submissions, as: :select
      f.input :description
      f.input :rules
      f.input :enabled, as: :select
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
