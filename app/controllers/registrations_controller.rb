class RegistrationsController < Devise::RegistrationsController
	before_action :get_website, except: [:new, :create]

  protected

    def after_update_path_for(resource)
      cms_home_path
    end

    def get_website
    	@website = current_user.website 
    end
end