class AddIndexToSubmissionOrganizationId < ActiveRecord::Migration
  def change
    add_index :submissions, [:organization_id, :category_id, :contest_year], unique: true, name: 'index_submissions_on_organization_id'
  end
end
