class RemoveIndexFromSubmissions < ActiveRecord::Migration
  def change
    remove_index :submissions, name: 'index_submissions_on_organization_id'
  end
end
