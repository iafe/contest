# Uses the Mandrill gem to deliver e-mail. Sends an e-mail to the user to notify that their submission was approved by IAFE staff.

class SubmissionApproved < ActionMailer::Base
  
  def approved(submission)
    mail subject: "#{submission.category.award.name} - Category #{submission.category.code} Approved",
         to:      submission.user.email,
         from:    "contest@fairsandexpos.com",
         content_type: "text/html",
         body:    "<p>Hello #{submission.user.first_name},</p> <p>Thank you for submitting your recent entry, #{submission.category.award.name} #{submission.category.code}: #{submission.category.name}. The IAFE has approved your submission.</p> <p>Please save this e-mail for your records. Remember to log into your IAFE contest account to double-check which categories you have or have not entered.</p> <p>Please contact the IAFE office at 417-862-5771 if you have any questions.</p><p>Kind Regards,</p><p>The IAFE Staff</p>"
         
  end
end