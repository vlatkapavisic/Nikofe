class WebsitesController < ApplicationController
  before_action :get_website, only: [:show, :edit, :update, :destroy]

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites
  def create
    website_ps = website_params 
    website_ps[:user_id] = current_user.id # protection against mass assignment!
    website_ps[:slug] = website_params[:name].parameterize
    @website = Website.new(website_ps)

    respond_to do |format|
      if @website.save
        format.html { redirect_to website_structure_url, notice: 'Website was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /websites/1
  def update
    website_ps = website_params 
    website_ps[:slug] = website_params[:name].parameterize
    respond_to do |format|
      if @website.update(website_ps)
        format.html { redirect_to website_structure_url, notice: 'Website was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /websites/1
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_website
      @website = current_user.website
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
      params.require(:website).permit(:name, :home_title, :home_body, :home_cover, :navbar_color, :navbar_text_color,
        :jumbotron_text_color)
    end
end
