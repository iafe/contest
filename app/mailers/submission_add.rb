# Uses the Mandrill gem to deliver e-mail.
# If the month is currently January through August, an e-mail will be sent to contest@fairsandexpos.com to notify that a new submission was made.

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