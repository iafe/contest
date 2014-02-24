class SubmissionDetail < ActiveRecord::Base
  
  belongs_to :submission
  
  validates :file_url, length: { maximum: 500,  minimum: 4 }
  validates_presence_of :file_url, if: :link?
  
  validates :submission_id, presence: true
  
  has_attached_file :attachment, styles: {
    thumb: ['200x200>', :jpg]
  }
  
  validates_presence_of :attachment, if: :nonlink?
  
  validates_attachment_content_type :attachment, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
  
  validates_attachment_size :attachment, less_than: 4.megabytes
  
  def nonlink?
    submission.category.submission_file_type == "Mixed (PDF and Images)" || submission.category.submission_file_type == "Images Only"
  end

  def link?
    submission.category.submission_file_type == "Video Only" || submission.category.submission_file_type == "URL Link Only"
  end
  
end
