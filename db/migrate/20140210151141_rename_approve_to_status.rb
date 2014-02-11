class RenameApproveToStatus < ActiveRecord::Migration
  def change
    add_column :submissions, :status, :string
    remove_column :submissions, :approved
  end
end
