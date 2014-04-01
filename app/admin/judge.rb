ActiveAdmin.register Judge do

  menu priority: 11
  
  permit_params :user_id, :category_id, :division_id
  
  index do
    column :id, sortable: :id do |judge|
      link_to judge.id, admin_judge_path(judge)
    end
    column "User", sortable: :user do |judge|
      link_to(judge.user.first_name + " " + judge.user.last_name, admin_user_path(judge.user.id))
    end
    column :category, sortable: :category
    column :division, sortable: :division
    column "Created", :created_at, sortable: :created_at do |judge|
      judge.created_at.strftime("%m/%d/%Y")
    end
    column "Updated", :updated_at, sortable: :updated_at do |judge|
      judge.updated_at.strftime("%m/%d/%Y")
    end
  end
  
  filter :category_name, as: :string
  filter :user_last_name, as: :string, label: "User's Last Name"
  filter :division_name, as: :string
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, :collection => User.where(judge: true).map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
      f.input :division
      f.input :category
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
