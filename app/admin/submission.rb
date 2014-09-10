ActiveAdmin.register Submission do
  
  scope :current_year_pending
  scope :current_year_incomplete
  scope :current_year_approved
  scope :current_year_rejected
  scope :current_year_disqualified

  menu priority: 9
  
  permit_params :category_id, :user_id, :organization_id, :division_id,
      :contest_year, :notes, :status, :physical_version_received, :digital_version_received, :disqualify, :disqualify_reason,
      :best_of_division, :judges_choice
      
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:user, :organization, :division, category: :award)
    end
    
  end
  
  before_save do |submission|
    if submission.status_changed?
      if submission.status == "Approved"
        SubmissionApproved.approved(submission).deliver
      end
    end
  end
  
  index do
    column :id, sortable: :id do |submission|
      link_to submission.id, admin_submission_path(submission)
    end
    column :status
    column "Created", :created_at, sortable: :created_at do |submission|
      submission.created_at.strftime("%m/%d/%Y")
    end
    column :organization, sortable: :organization
    column "User", sortable: :user do |submission|
      link_to(submission.user.first_name + " " + submission.user.last_name, admin_user_path(submission.user.id))
    end
    column "Award", sortable: :award do |submission|
      submission.category.award.name
    end
    column "Code", sortable: :sort_by_category_codes do |submission|
      submission.category.code
    end
    column :division, sortable: :division
    column "PV?", :physical_version_received
    column "DV?", :digital_version_received
    column "DQ?", :disqualify
    column "Min. Scores?" do |submission|
      submission.enough_scores?
    end
    column "Files" do |submission|
      link_to "Files(#{submission.submission_details.count})", admin_submission_details_path('q[submission_id_eq]' => submission.id)
    end
    column "Score" do |submission|
      submission.calculate_final_score
    end
  end
  
  filter :category
  filter :organization_name, as: :string
  filter :division
  filter :contest_year
  filter :status, as: :select
  filter :physical_version_received, as: :select, label: "Physical Version Received?"
  filter :digital_version_received, as: :select, label: "Digital Version Received?"
  filter :disqualify, as: :select, label: "Disqualified?"
  filter :best_of_division, as: :select, label: "Best of Division?"
  filter :judges_choice, as: :select, label: "Judge's Choice?"
  filter :created_at
  filter :updated_at
  
  csv do
    column :id
    column :status
    column(:created_at) { |submission| submission.created_at.strftime("%m/%d/%Y") }
    column(:organization)  { |submission| submission.organization.name }
    column("Submitted By") { |submission| submission.user.first_name + " " + submission.user.last_name }
    column("User Email") { |submission| submission.user.email }
    column("User Phone") { |submission| submission.user.phone }
    column("Organization Phone") { |submission| submission.organization.phone }
    column("Organization Address Line 1") { |submission| submission.organization.address_line_1 }
    column("Organization Address Line 2") { |submission| submission.organization.address_line_2 }
    column("Organization City") { |submission| submission.organization.city }
    column("Organization State/Province") { |submission| submission.organization.state_province }
    column("Organization Zip Code") { |submission| submission.organization.zip_code }
    column("Organization Country") { |submission| submission.organization.country }
    column(:award) { |submission| submission.category.award.name }
    column(:code) { |submission| submission.category.code }
    column(:category)  { |submission| submission.category.name }
    column(:division)  { |submission| submission.division.name }
    column :physical_version_received
    column :digital_version_received
    column :disqualify
    column :disqualify_reason
    column("Min. Score # Met?") { |submission| submission.enough_scores? }
    column("Score")  { |submission| submission.calculate_final_score }
    column :best_of_division
    column :judges_choice
  end
  
  form do |f|
    f.inputs do
      f.input :category_id, as: :select, required: true, :collection => Category.includes(:award).where(enabled: true).map{|c| ["#{c.award.name} #{c.code}: #{c.name}", c.id]}
      f.input :organization_id, label: "Organization ID"
      f.input :user_id, label: "User ID"
      f.input :division, label: "Division", required: true
      f.input :contest_year
      f.input :status, as: :select, :collection => ["Incomplete", "Pending", "Approved", "Rejected"], required: true
      f.input :notes
      f.input :physical_version_received, as: :select, required: true
      f.input :digital_version_received, as: :select, required: true
      f.input :disqualify, as: :select, required: true
      f.input :disqualify_reason, label: "Disqualification Reason"
      f.input :best_of_division, as: :select, required: true, label: "Best of Division?"
      f.input :judges_choice, as: :select, required: true, label: "Judge's Choice?"
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
