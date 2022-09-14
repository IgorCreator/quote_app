class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_category, only: [:show, :edit, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New category [##{@category.name}] was created successfully."
      redirect_to @category
    else
      render 'new'
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end

  def show
  end

  def edit
  end

  def update
    # code here
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
