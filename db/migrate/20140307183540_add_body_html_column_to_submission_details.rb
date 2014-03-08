class AddBodyHtmlColumnToSubmissionDetails < ActiveRecord::Migration
  def change
    add_column :submission_details, :body_html, :string
  end
end
