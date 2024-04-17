class ApplicationController < ActionController::Base
  before_action :set_query
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  def set_query
    @query = Product.ransack(params[:q])
  end

  def configure_devise_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :postal_code, :city, :province_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :postal_code, :city, :province_id])
  end

end
