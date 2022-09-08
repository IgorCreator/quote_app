class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      flash[:notice] = "Quote was created successfully."
      redirect_to @quote
    else
      render 'new'
    end
  end

  def update
    if @quote.update(quote_params)
      flash[:notice] = "Quote was updated successfully."
      redirect_to @quote
    else
      render 'edit'
    end
  end

  def destroy
    @quote.destroy
    flash[:notice] = "Quote was successfully deleted"
    redirect_to quotes_path
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content)
  end
end
