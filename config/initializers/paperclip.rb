require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

Paperclip.interpolates :year do |attachment, style|
  attachment.instance.submission.contest_year
end

Paperclip.interpolates :div do |attachment, style|
  attachment.instance.submission.division.name.parameterize
end

Paperclip.interpolates :org do |attachment, style|
  attachment.instance.submission.organization.name.parameterize
end

Paperclip.interpolates :orgid do |attachment, style|
  attachment.instance.submission.organization.id
end

Paperclip.interpolates :aw do |attachment, style|
  attachment.instance.submission.category.award.name.parameterize
end

Paperclip.interpolates :cat do |attachment, style|
  attachment.instance.submission.category.code.parameterize
end

Paperclip.interpolates :sub do |attachment, style|
  attachment.instance.submission.id
end

Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/contest/:year/:div/:org_:orgid/:aw/cat_:cat/:sub/:id_:style.:extension'
