ActiveAdmin.register Submission do
  
  scope :current_year_pending
  scope :current_year_incomplete
  scope :current_year_approved
  scope :current_year_rejected
  scope :current_year_disqualified

  menu priority: 9
  
  index do
    column :id, sortable: :id do |submission|
      link_to submission.id, admin_submission_path(submission)
    end
    column :status
    column "Created", :created_at, sortable: :created_at do |submission|
      submission.created_at.strftime("%m/%d/%Y")
    end
    column :organization, sortable: :organization
    column "Submitted By", sortable: :user do |submission|
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
    column "Score" do |submission|
      submission.calculate_final_score
    end
    column "Winner?" do |submission|
      submission.winner?
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
    column("Score")  { |submission| submission.calculate_final_score }
    column("Winner?")  { |submission| submission.winner? }
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
