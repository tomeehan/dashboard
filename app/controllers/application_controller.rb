class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?
    before_filter :get_users

    def get_users
    	@users = User.all.order("created_at DESC")
    end

   	protected

	  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :name, :phone, :charlie_hr, :twitter_url, :twitter_handle, :linkedin, :job_title) }	   
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :phone, :charlie_hr, :twitter_url, :twitter_handle, :linkedin, :job_title) }
	  end
end
