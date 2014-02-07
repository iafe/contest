class SubmissionDetail < ActiveRecord::Base
  
  belongs_to :submission
  
  validates :file_url, presence: true, length: { maximum: 500,  minimum: 4 }
  validates :submission_id, presence: true
end
