ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome"
        span link_to(current_user.email, admin_user_path(current_user))
        br
        span "This year"
        span Submission.all(conditions: ['contest_year = ?', Time.now.year]).count
        span "submissions have been entered, compared to"
        span Submission.all(conditions: ['contest_year = ?', Time.now.year - 1]).count
        span "submissions last year."
        span Submission.count
        span "submissions have been entered out of all time."
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end
    
    columns do
      column do
        panel "Recent Submissions" do
          table do
            tr do
              th "ID"
              th "Status"
              th "Award"
              th "Cat Code"
              th "Organization"
              th "Created"
            end
            Submission.order('created_at DESC').limit(10).map do |submission|
              tr do
                td link_to(submission.id, admin_submission_path(submission))
                td submission.status
                td submission.category.award.name
                td submission.category.code
                td submission.organization.name
                td submission.created_at.strftime("%m/%d/%Y")
              end
            end
          end
        end
        panel "Recent New Organizations" do
          table do
            tr do
              th "ID"
              th "Enabled?"
              th "Organization"
              th "State"
              th "Phone"
              th "Created"
            end
            Organization.order('created_at DESC').limit(10).map do |organization|
              tr do
                td link_to(organization.id, admin_organization_path(organization))
                td organization.enabled
                td organization.name
                td organization.state_province
                td organization.phone
                td organization.created_at.strftime("%m/%d/%Y")
              end
            end
          end
        end
      end
      column do
        panel "Recent New Users" do
          table do
            tr do
              th "ID"
              th "Enabled?"
              th "First"
              th "Last"
              th "E-mail"
              th "Created"
            end
            User.order('created_at DESC').limit(10).map do |user|
              tr do
                td link_to(user.id, admin_user_path(user))
                td user.enabled
                td user.first_name
                td user.last_name
                td mail_to(user.email, user.email)
                td user.created_at.strftime("%m/%d/%Y")
              end
            end
          end
        end
        panel "Recent New Relationships Between User and Organizations" do
          table do
            tr do
              th "ID"
              th "First"
              th "Last"
              th "Organization"
              th "Created"
            end
            UserOrganization.order('created_at DESC').limit(10).map do |user_organization|
              tr do
                td link_to(user_organization.id, admin_user_organization_path(user_organization))
                td user_organization.user.first_name
                td user_organization.user.last_name
                td user_organization.organization.name
                td user_organization.created_at.strftime("%m/%d/%Y")
              end
            end
          end
        end
      end
    end
  end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    # content
end
