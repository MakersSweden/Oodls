class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:organisation, :description, :logo, :contact_name, :full_address, :postcode, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:organisation, :description, :contact_name, :full_address, :postcode, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource_or_scope)
  	if resource_or_scope.is_a?(Charity)
  		charity_path
  	else
  		super
  	end
  end

end
