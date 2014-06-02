class RegistrationsController < Devise::RegistrationsController
	before_action :get_website, only: :edit

	private
	def get_website
		@website = current_user.website
	end
end