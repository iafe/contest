ActiveAdmin.register Category do

  menu priority: 7
  
  index do
    column :id, sortable: :id do |category|
      link_to category.id, admin_category_path(category)
    end
    column :award, sortable: :award
    column :code
    column :name
    column "File Type", :submission_file_type
    column "Doc Max #", :document_max_number
    column "Photo Max #", :photo_max_number
    column "Video Max #", :video_max_number
    column "Link Max #", :link_max_number
    column "Max File Size", :max_total_file_size
    column :enabled
  end
  
  filter :award
  filter :code, as: :string
  filter :name, as: :string
  filter :submission_file_type
  filter :enabled, as: :select, label: "Enabled?"
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
