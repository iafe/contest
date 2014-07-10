ActiveAdmin.register OrganizationDetail do
  
  menu label: "Dates & Attendance", priority: 4
  
  permit_params :organization_id, :fair_start_date, :fair_end_date, :total_attendance
  
    # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:organization)
    end
  end
  
  index do
    column :id, sortable: :id do |organization_detail|
      link_to organization_detail.id, admin_organization_detail_path(organization_detail)
    end
    column :organization, sortable: :organization
    column :fair_start_date
    column :fair_end_date
    column "Attendance", :total_attendance
    column "Created", :created_at, sortable: :created_at do |organization_detail|
      organization_detail.created_at.strftime("%m/%d/%Y")
    end
    column "Updated", :updated_at, sortable: :updated_at do |organization_detail|
      organization_detail.created_at.strftime("%m/%d/%Y")
    end
    actions
  end
  
  filter :organization_name, as: :string
  filter :fair_start_date
  filter :fair_end_date
  filter :total_attendance
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :organization_id, as: :string, label: "Organization ID", required: true
      f.input :fair_start_date
      f.input :fair_end_date
      f.input :total_attendance
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
