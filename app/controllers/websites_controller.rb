class WebsitesController < ApplicationController
  before_action :set_website, only: [:show, :edit, :update, :destroy]

  # GET /websites/1
  def show
  end

  # GET /websites/new
  def new
    @website = Website.new
  end

  # GET /websites/1/edit
  def edit
  end

  # POST /websites
  def create
    website_ps = website_params # to_do: prettify
    website_ps[:user_id] = current_user.id # protection against mass assignment!
    website_ps[:slug] = website_params[:name].parameterize
    @website = Website.new(website_ps)

    respond_to do |format|
      if @website.save
        format.html { redirect_to website_structure_url, notice: 'Website was successfully created.' }
        format.json { render action: 'show', status: :created, location: @website }
      else
        format.html { render action: 'new' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /websites/1
  def update
    respond_to do |format|
      if @website.update(website_params)
        format.html { redirect_to website_structure_url, notice: 'Website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @website.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  def destroy
    @website.destroy
    respond_to do |format|
      format.html { redirect_to websites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_website
      @website = current_user.website
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def website_params
      params.require(:website).permit(:name, :home_title, :home_body, :home_cover, :navbar_color, :navbar_text_color,
        :jumbotron_text_color)
    end
end
