class OrganizationChange < ActionMailer::Base
  
  def changed(organization)
    @organization = organization
    mail subject: "IAFE Contest - #{organization.name} Has Been Changed",
         to:      "contest@fairsandexpos.com",
         from:    "contest@fairsandexpos.com",
         content_type: "text/html",
         body:    "<p>Someone has updated ID #{organization.id} - #{organization.name}'s record in the IAFE Contest site.</p> <p>Record Snippet:</p> <p>Organization Name: #{organization.name}<br/> Primary Contact: #{organization.primary_contact}<br/> Address Line 1: #{organization.address_line_1}<br/> Address Line 2: #{organization.address_line_2}<br/> City: #{organization.city}<br/> State/Province: #{organization.state_province}<br/> Zip Code: #{organization.zip_code}<br/> Country: #{organization.country}<br/> Phone: #{organization.phone}</p>"
         
  end
end