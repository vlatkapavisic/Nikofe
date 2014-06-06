class CmsPagesController < ApplicationController
	layout "website_layout", only: [ :website_preview, :show_page ]
	before_action :authenticate_user!, only: [ :website_structure ]

	def home
		if user_signed_in?
			@website = current_user.website
		end
	end

	def website_structure
		if @website = current_user.website
			@pages = @website.pages
			@navbar_items = @website.navbar_items.order(:created_at)
			@independent_pages = @pages.where("navbar_item_id is NULL").order(:created_at)
		end
	end

	def website_preview
		@website = Website.find_by(slug: params[:website_slug])
		@pages = @website.pages 
		@navbar_items = @website.navbar_items.order(:created_at)
		@independent_pages = @pages.where(["navbar_item_id is NULL and website_id = ?", @website.id]).order(:created_at)
	end

	def show_page
		@website = Website.find_by(slug: params[:website_slug])
		@pages = @website.pages 
		@navbar_items = @website.navbar_items.order(:created_at)
		@independent_pages = @pages.where(["navbar_item_id is NULL and website_id = ?", @website.id]).order(:created_at)
		@page = Page.where("website_id = ? and slug = ?", @website.id, params[:page_slug]).first #sve prebaciti u where
	end

end
