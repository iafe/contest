class AddAttachmentToSubmissionDetails < ActiveRecord::Migration
  def self.up
    add_attachment :submission_details, :attachment
  end

  def self.down
    remove_attachment :submission_details, :attachment
  end
end
