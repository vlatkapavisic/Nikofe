class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :get_website
  before_action :authenticate_user!

  # GET /pages
  def index
    @pages = current_user.pages.all
  end

  # GET /pages/1
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
    @navbar_items = current_user.navbar_items.all
  end

  # GET /pages/1/edit
  def edit
    @navbar_items = current_user.navbar_items.all
  end

  # POST /pages
  def create
    page_ps = page_params # to_do: prettify
    page_ps[:user_id] = current_user.id # protection against mass assignment!
    page_ps[:slug] = page_params[:title].parameterize
    page_ps[:website_id] = @website.id
    @page = Page.new(page_ps)

    respond_to do |format|
      if @page.save
        format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was successfully created." }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  def update
    page_ps = page_params # to_do: prettify
    page_ps[:slug] = page_params[:title].parameterize
    respond_to do |format|
      if @page.update(page_ps)
        format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to website_structure_url, notice: "Page \"#{@page.title}\" was deleted." }
      format.json { head :no_content }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :body, :navbar_item_id, :bootsy_image_gallery_id, :address)
    end
end
