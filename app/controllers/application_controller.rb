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


    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to new_user_session_path, :notice => 'if you want to add a notice'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end
end
