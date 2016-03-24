# Part of the Devise gem for logging in. Prompts new users to link their account to a company.

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    new_user_organization_path(@user_organization)
  end
end