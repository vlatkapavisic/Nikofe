class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      cms_home_path
    end
end