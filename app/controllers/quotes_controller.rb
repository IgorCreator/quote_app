class QuotesController < ApplicationController

  def show
    @quote = Quote.find(params[:id])
  end

  def index
    @quotes = Quote.all
  end

  def new
  end

  def create
    @quote = Quote.new(params.require(:quote).permit(:content))
    @quote.save
    redirect_to @quote
  end
end
