class RegistrationsController < Devise::RegistrationsController
	before_action :get_website, except: [:new, :create]

end