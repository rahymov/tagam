class CategoriesController < ApplicationController
  before_action :set_params , only: [:show, :edit, :update, :destroy]
  def index
  	@categories = Category.all
  end

  def show
  	
  end
  def destroy
  	
  end

  private

  def set_params
  	@category = Category.find(params[:id])
  end
  def category_params
  	params.require(:category).permit(:name)
  end
end
