class QuotesController < ApplicationController

  def show
    @quote = Quote.find(params[:id])
  end

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def create
    @quote = Quote.new(params.require(:quote).permit(:content))
    if @quote.save
      flash[:notice] = "Quote was created successfully."
      redirect_to @quote
    else
      render 'new'
    end
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(params.require(:quote).permit(:content))
      flash[:notice] = "Quote was updated successfully."
      redirect_to @quote
    else
      render 'edit'
    end
  end
end
