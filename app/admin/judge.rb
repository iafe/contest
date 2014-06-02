ActiveAdmin.register Judge do

  menu priority: 11
  
  permit_params :user_id, :category_id, :division_id
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(:user, :category, :division)
    end
  end
  
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
    column "Sheet" do |judge|
      link_to "Sheet", pdf_admin_judge_path(id: judge.id, format: :pdf), target: "_blank"
    end
    default_actions
  end
  
  filter :category_name, as: :string
  filter :user_last_name, as: :string, label: "User's Last Name"
  filter :division_name, as: :string
  filter :created_at
  filter :updated_at
  
  form do |f|
    f.inputs do
      f.input :user_id, :label => 'User', :as => :select, required: true, :collection => User.where(judge: true).map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
      f.input :division, required: true
            f.input :category_id, as: :select, required: true, :collection => Category.includes(:award).where(enabled: true).map{|c| ["#{c.award.name} #{c.code}: #{c.name}", c.id]}
    end
    f.actions
  end
  
  member_action :pdf do
        @judge = Judge.find(params[:id])
        @score_items = ScoreItem.where(category_id: @judge.category_id)
        @submissions = Submission.where(division_id: @judge.division_id, category_id: @judge.category_id, status: "Approved", contest_year: Time.now.year)
        respond_to do |format|
            format.pdf do
              render :pdf => "sheet",
              :template => 'admin/judges/sheet.pdf.erb',
              :wkhtmltopdf => 'C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe'
          end
        end
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
