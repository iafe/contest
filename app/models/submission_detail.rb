class SubmissionDetail < ActiveRecord::Base
  
  belongs_to :submission
  
  # validates :file_url, presence: true, length: { maximum: 500,  minimum: 4 }
  validates :submission_id, presence: true
  
  has_attached_file :attachment, styles: {
    thumb: '200x200>',
    large: '800x800>'
  }
  
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\Z/
  
end
