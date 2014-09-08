ActiveAdmin.register SubmissionDetail do

  menu label: "Attachments", priority: 10
  
  permit_params :submission_id, :file_url, :attachment
  
  # Prevents N+1 Queries
  controller do
    def scoped_collection
      resource_class.includes(submission: [:organization, :division, category: :award])
    end
  end
  
  index as: :grid, columns: 5 do |submission_detail|
    if submission_detail.file_url != nil
      link_to "URL Submission", submission_detail.file_url
    else
      link_to image_tag(submission_detail.attachment.url(:thumb)), submission_detail.attachment.url(:original), target: "_blank"
    end
  end
  
  filter :submission_id, as: :string, label: "Submission ID"
  filter :attachment_content_type
  filter :attachment_file_size
  filter :file_url, label: "URL if URL Submission"
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
