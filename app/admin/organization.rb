ActiveAdmin.register Organization do
  
  menu priority: 2
  
  permit_params :name, :primary_contact, :address_line_1, :address_line_2, :city, :state_province, :country, :zip_code, :phone, :fair, :enabled
  
  index do
    column :id, sortable: :id do |organization|
      link_to organization.id, admin_organization_path(organization)
    end
    column :name
    column :primary_contact
    column "State", :state_province
    column "Office Phone", :phone
    column :fair
    column :enabled
    column :created_at, sortable: :created_at do |organization|
      organization.created_at.strftime("%m/%d/%Y")
    end
    column :updated_at, sortable: :updated_at do |organization|
      organization.updated_at.strftime("%m/%d/%Y")
    end
    default_actions
  end
  
  filter :name
  filter :primary_contact
  filter :state_province, as: :select, label: "State/Province"
  filter :country, as: :select
  filter :fair, as: :select, label: "Fair?"
  filter :enabled, as: :select, label: "Enabled?"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :primary_contact
      f.input :address_line_1
      f.input :address_line_2
      f.input :city
      f.input :state_province
      f.input :country
      f.input :zip_code
      f.input :phone
      f.input :fair, as: :select, required: true
      f.input :enabled, as: :select, required: true
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
