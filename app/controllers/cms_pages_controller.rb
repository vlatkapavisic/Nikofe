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
		if user_signed_in?
			@page = current_user.pages.find_by(slug: params[:page_slug])
		else
			@website = Website.find_by(slug: params[:website_slug])
			@page = Page.where("website_id = ? and slug = ?", @website.id, params[:page_slug]) #sve prebaciti u where
		end
	end

	private
	
	def get_data
		if user_signed_in?
			if current_user.website
				@website = current_user.website
				@pages = @website.pages
				@navbar_items = @website.navbar_items.order(:created_at)
				@independent_pages = @pages.where("navbar_item_id is NULL").order(:created_at)
			end
		else
			@website = Website.find_by(slug: params[:website_slug])
			@pages = @website.pages 
			@navbar_items = @website.navbar_items.order(:created_at)
			@independent_pages = @pages.where(["navbar_item_id is NULL and website_id = ?", @website.id]).order(:created_at)
		end
	end

end
