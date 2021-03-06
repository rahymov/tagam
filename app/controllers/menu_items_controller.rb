class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]


  def index
    
    # @menu_items = MenuItem.all
    if params[:category].present?
      @category_id = Category.find_by(name: params[:category]).id
      @menu_items = MenuItem.where(category_id: @category_id).order("created_at DESC")
    else 
      @menu_items = MenuItem.all
    end
  end

  def show
  end
  
  def menu_item_by_slug
    @category = Category.friendly.find(params[:slug])
    # @menu_item = MenuItem.friendly.find(params[:category_id])
  end

  def new
    @category = Category.find(params[:category_id]).id
    @menu_item = @category.menu_items.new
  end

  def edit
  end

  def create
    @menu_item = current_admin.build(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_items_url, notice: 'Menu item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @category = Category.friendly.find(params[:category_id])
      @menu_item = MenuItem.firendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.require(:menu_item).permit(:title, :description, :price, :category_id)
    end
end
