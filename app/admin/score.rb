ActiveAdmin.register Score do

  menu priority: 12
  
  permit_params :user_id, :submission_id, :total_score, :comments, :disqualify
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:user, :submission)
    end
  end
  
  index do
    column :id, sortable: :id do |score|
      link_to score.id, admin_score_path(score)
    end
    column "Score", :total_score
    column "Submission", sortable: :submission do |score|
      link_to(score.submission.id, admin_submission_path(score.submission.id))
    end
    column "User", sortable: :user do |score|
      link_to(score.user.first_name + " " + score.user.last_name, admin_user_path(score.user.id))
    end
    column :comments
    column :disqualify
    column "Created", :created_at, sortable: :created_at do |award|
      award.created_at.strftime("%m/%d/%Y")
    end
  end
  
  filter :user_last_name, as: :string
  filter :submission_id, as: :string
  filter :total_score, label: "Score"
  filter :disqualify, as: :select, label: "Disqualify?"
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :user_id, :label => 'Judge', :as => :select, required: true, :collection => User.where(judge: true).map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
      f.input :submission_id, :label => 'Submission ID', required: true
      f.input :total_score
      f.input :comments
      f.input :disqualify, as: :select, label: "Disqualify?", required: true
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
