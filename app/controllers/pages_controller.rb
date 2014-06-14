class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :get_website
  before_action :get_navbar_items, only: [:new, :edit, :create]
  before_action :authenticate_user!

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  def create
    page_ps = page_params 
    page_ps[:user_id] = current_user.id # protection against mass assignment!
    page_ps[:slug] = page_params[:title].parameterize
    page_ps[:website_id] = @website.id
    @page = Page.new(page_ps)

    respond_to do |format|
      if @page.save
        format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was successfully created." }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    page_ps = page_params 
    page_ps[:slug] = page_params[:title].parameterize
    respond_to do |format|
      if @page.update(page_ps)
        format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was successfully updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was deleted." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = current_user.pages.find(params[:id])
    end

    def get_website
      @website = current_user.website
    end

    def get_navbar_items
      @navbar_items = current_user.navbar_items.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :navbar_item_id, :address, :video_code)
    end
end
