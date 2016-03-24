class SubmissionDetail < ActiveRecord::Base
  
  belongs_to :submission
  
  after_create :set_parent_to_pending # See below
  
  after_update :set_parent_to_pending
  
  validates :file_url, length: { maximum: 500,  minimum: 4 }, allow_blank: true
  
  validates_presence_of :file_url, if: :link?
  
  validates :submission_id, presence: true
  
  validate on: :create do
    if submission.submission_details.count >= submission.category.document_max_number
      errors.add :base, ("You have submitted more documents to this entry than what is allowed under this category. 
      Please delete another attachment currently saved to this submission before uploading additional items.")
    end
  end
  
  has_attached_file :attachment, styles: {thumb: ['200x200>', :jpg]}, convert_options: { all: '-flatten -background white'}
  
  validates_presence_of :attachment, if: :nonlink?
  
  validates_attachment_content_type :attachment, content_type: ['image/jpeg', 'image/png', 'image/gif', 'application/pdf']
  
  validate :validate_file_size
 
  def validate_file_size
    if attachment.file? && attachment.size > submission.category.max_total_file_size.megabytes
      errors.add :base, ("This file is greater than the max total file size allowed.")
    end
  end
  
  def nonlink?
    submission.category.submission_file_type == "Mixed (PDF and Images)" || submission.category.submission_file_type == "Images Only"
  end

  def link?
    submission.category.submission_file_type == "Video Only" || submission.category.submission_file_type == "URL Link Only"
  end
  
  # Allows YouTube links to become embedded into the page.
  auto_html_for :file_url do
    html_escape
    youtube(width: 560)
    vimeo(width: 560)
    simple_format
  end
  
  private
    # If an attachment is made/updated, the submission is no longer approved and the staff must re-approve it.
    # The exception is if the user who created or updated the attachment is an IAFE staff person.
    def set_parent_to_pending
      submission.update(status: 'Pending') unless submission.nil? || submission.user.admin == true
    end

end
