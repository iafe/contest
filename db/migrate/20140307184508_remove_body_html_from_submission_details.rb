class RemoveBodyHtmlFromSubmissionDetails < ActiveRecord::Migration
  def change
    remove_column :submission_details, :body_html, :string
  end
end
