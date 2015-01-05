# Files in the Admin folder affect the backend functionality, for IAFE staff only. Uses the ActiveAdmin gem.

ActiveAdmin.register SubmissionDetail do

  menu label: "Attachments", priority: 10
  
  permit_params :submission_id, :file_url, :attachment
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(submission: [:organization, :division, category: :award])
    end
  end
  
  index as: :grid, columns: 5 do |submission_detail| # Unlike the other pages, submission details are shown through thumbnails
    if submission_detail.file_url != nil
      link_to "URL Submission", admin_submission_detail_path(submission_detail)
    else
      link_to image_tag(submission_detail.attachment.url(:thumb)), admin_submission_detail_path(submission_detail)
    end
  end
  
  # The Show page when you click on a thumbnail, here you can delete the attachment if you want.
  show do |submission_detail|
    attributes_table do
      row :submission_id
      if submission_detail.file_url != nil
        row :file_url do
          link_to submission_detail.file_url, submission_detail.file_url
        end
      else
        row :attachment do
          link_to submission_detail.attachment.url(:original), submission_detail.attachment.url(:original), target: "_blank"
        end
      end
      row :attachment_file_name
      row :attachment_content_type
      row :attachment_file_size
      row :attachment_updated_at
      row :created_at
      row :updated_at
    end
  end
  
  filter :submission_id, as: :string, label: "Submission ID"
  filter :attachment_content_type
  filter :attachment_file_size
  filter :file_url, label: "URL if URL Submission"
  
end
