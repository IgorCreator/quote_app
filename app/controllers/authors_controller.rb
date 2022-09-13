class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def show
    @quotes = @author.quotes.paginate(page: params[:page], per_page: 5)
  end

  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author was created successfully."
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author was updated successfully."
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:notice] = "Author was successfully deleted"
    redirect_to authors_path
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :middle_name, :last_name)
  end
end
