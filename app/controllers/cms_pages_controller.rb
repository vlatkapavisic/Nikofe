class CmsPagesController < ApplicationController
	layout "website_layout", only: [ :website_preview, :show_page ]
	before_action :authenticate_user!, only: [ :website_structure, :home ]
	before_action :get_data, only: [:website_structure, :website_preview, :show_page]

	def home
		@website = current_user.website
	end

	def website_structure
	end

	def website_preview
	end

	def show_page
		@page = current_user.pages.find_by(slug: params[:page_slug])
	end

	private
	
	def get_data
		@pages = current_user.pages.all
		@navbar_items = current_user.navbar_items.order(:created_at)
		@independent_pages = current_user.pages.where(navbar_item_id: nil).order(:created_at)
		@website = current_user.website
	end

end
