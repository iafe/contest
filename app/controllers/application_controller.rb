class ApplicationController < ActionController::Base
  
  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :set_awards

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :suffix, :phone, 
      :email_confirmation, :admin, :judge, :enabled, :email, :password, :password_confirmation)}
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awards
      @awards = Award.all
    end
  
end
