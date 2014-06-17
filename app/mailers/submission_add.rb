class SubmissionAdd < ActionMailer::Base
  
  def added(submission)
    @submission = submission
    mail subject: "IAFE Contest - New Submission - #{submission.category.award.name}, Cat. #{submission.category.code}",
         to:      "contest@fairsandexpos.com",
         from:    "contest@fairsandexpos.com",
         content_type: "text/html",
         body:    "<p>Someone has created a new submission for #{submission.category.award.name}, Cat. #{submission.category.code}. Please check the contest website to view this entry.</p>"
         
  end
end