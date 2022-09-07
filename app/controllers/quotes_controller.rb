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

  def create
    @quote = Quote.new(params.require(:quote).permit(:content))
    if @quote.save
      flash[:notice] = "Quote was created successfully."
      redirect_to @quote
    else
      render 'new'
    end
  end
end
