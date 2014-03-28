ActiveAdmin.register Award do
  
  menu priority: 6
  
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
