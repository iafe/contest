ActiveAdmin.register User do

  menu priority: 1
  
  index do
    column :id, sortable: :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column "First", :first_name
    column "Last", :last_name
    column :suffix
    column :phone
    column :email
    column :admin
    column :judge
    column :enabled
    column :created_at, sortable: :created_at do |user|
      user.created_at.strftime("%m/%d/%Y")
    end
    default_actions
  end
  
  filter :first_name
  filter :last_name
  filter :phone
  filter :email
  filter :admin, as: :select, label: "Admin?"
  filter :judge, as: :select, label: "Judge?"
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
