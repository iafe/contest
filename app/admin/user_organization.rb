ActiveAdmin.register UserOrganization do

  menu label: "Relationships", priority: 3
  
  permit_params :user_id, :organization_id, :primary
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:user, :organization)
    end
  end
  
  index do
    column :id, sortable: :id do |user_organization|
      link_to user_organization.id, admin_user_organization_path(user_organization)
    end
    column :organization, sortable: :organization
    column "User", sortable: :user do |user_organization|
      link_to(user_organization.user.first_name + " " + user_organization.user.last_name, admin_user_path(user_organization.user.id))
    end
    column "User's Primary Org?", :primary
    column :created_at, sortable: :created_at do |user|
      user.created_at.strftime("%m/%d/%Y")
    end
    actions
  end
  
  filter :organization_name, as: :string
  filter :user_last_name, as: :string, label: "User's Last Name"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :user_id, as: :string, label: "User ID", required: true
      f.input :organization_id, as: :string, label: "Organization ID", required: true
      f.input :primary, as: :select, label: "User's Primary Organization?", required: true
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
