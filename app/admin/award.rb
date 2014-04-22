ActiveAdmin.register Award do
  
  menu priority: 6
  
  permit_params :name, :description, :rules, :sponsor, :sponsor_logo, :enabled
  
  index do
    column :id, sortable: :id do |award|
      link_to award.id, admin_award_path(award)
    end
    column :name
    column :sponsor
    column :enabled
    column "Created", :created_at, sortable: :created_at do |award|
      award.created_at.strftime("%m/%d/%Y")
    end
    column "Updated", :updated_at, sortable: :updated_at do |award|
      award.updated_at.strftime("%m/%d/%Y")
    end
    default_actions
  end
  
  filter :name
  filter :sponsor
  filter :enabled, as: :select, label: "Enabled?"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :rules
      f.input :sponsor, label: "Sponsor Name"
      f.input :sponsor_logo, label: "URL of Sponsor's Logo"
      f.input :enabled, as: :select, label: "Enabled?", required: true
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
