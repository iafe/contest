# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

ActiveAdmin.register User do

  menu priority: 1
  
  permit_params :id, :first_name, :last_name, :suffix, :email, :email_confirmation, :phone, :created_at, :updated_at, 
      :admin, :judge, :enabled, :reset_password_token, :reset_password_sent_at, :encrypted_password, :password_confirmation,
      :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
  
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
    actions
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
  
  form do |f|
    f.inputs do
      f.input :first_name, required: true
      f.input :last_name, required: true
      f.input :suffix
      f.input :phone, required: true
      f.input :email, required: true
      f.input :email_confirmation, required: true
      f.input :admin, as: :select, required: true, label: "Admin?"
      f.input :judge, as: :select, required: true, label: "Judge?"
      f.input :enabled, as: :select, required: true, label: "Enabled?"
    end
    f.actions
  end

end
