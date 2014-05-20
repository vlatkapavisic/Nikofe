class NavbarItemsController < ApplicationController
  before_action :set_navbar_item, only: [:show, :edit, :update, :destroy]
  before_action :get_website
  before_action :authenticate_user!


  # GET /navbar_items/new
  def new
    @navbar_item = NavbarItem.new
  end

  # GET /navbar_items/1/edit
  def edit
  end

  # POST /navbar_items
  def create
    navbar_item_ps = navbar_item_params # to_do: prettify
    navbar_item_ps[:user_id] = current_user.id
    navbar_item_ps[:website_id] = @website.id
    @navbar_item = NavbarItem.new(navbar_item_ps)

    respond_to do |format|
      if @navbar_item.save
        format.html { redirect_to website_structure_url, notice: "Navbar item \"#{@navbar_item.name}\" was successfully created." }
        format.json { render action: 'show', status: :created, location: @navbar_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @navbar_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /navbar_items/1
  def update
    respond_to do |format|
      if @navbar_item.update(navbar_item_params)
        format.html { redirect_to website_structure_url, notice: "Navbar item \"#{@navbar_item.name}\" was successfully updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @navbar_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /navbar_items/1
  def destroy
    @navbar_item.destroy
    respond_to do |format|
      format.html { redirect_to website_structure_url, notice: "Navbar item \"#{@navbar_item.name}\" was deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_navbar_item
      @navbar_item = current_user.navbar_items.find(params[:id])
    end

    def get_website
      @website = current_user.website
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def navbar_item_params
      params.require(:navbar_item).permit(:name)
    end
end
