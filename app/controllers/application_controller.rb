class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :update_sanitized_params, if: :devise_controller?
  
  # CanCan workaround for allowed parameters
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  
  before_action :set_awards

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:first_name, :last_name, :suffix, :phone, 
      :email_confirmation, :admin, :judge, :enabled, :email, :password, :password_confirmation)}
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
