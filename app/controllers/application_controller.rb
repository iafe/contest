class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :contest_deadline
  
  before_action :set_awards

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :suffix, :phone, 
      :email_confirmation, :admin, :judge, :enabled, :email, :password, :password_confirmation)}
  end
  
  def contest_deadline
    @deadline = Date.strptime('10/03/2014', '%m/%d/%Y')
    @actual_deadline = Date.strptime('10/10/2014', '%m/%d/%Y')
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not permitted to access that page."
    redirect_to root_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awards
      @awards = Award.all
    end
    
end
