class QuotesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @quotes = Quote.paginate(page: params[:page], per_page: 5)
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

  def import
  end

  def upload
    if params[:file] == nil || params[:file] == ''
      flash[:notice] = "Please select file"
      redirect_to import_quotes_path
      return
    end

    if params[:file].content_type != 'application/json'
      flash[:notice] = "Only JSON file can be processed. Select correct file please."
      redirect_to import_quotes_path
    else
      parseJson
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content, :author_id, category_ids: [])
  end

  # def experiment_import
  #   file_data = params[:file].tempfile
  #   File.open(file_data, 'r') do |file|
  #     author = nil
  #     content = nil
  #     categories = []
  #     file.each do |line|
  #       if line.contains '{'
  #         author = nil
  #         content = nil
  #         categories = []
  #       elsif line.contains 'text'
  #         content = line
  #       elsif line.contains 'author'
  #         author = Author.create(full_name: line)
  #       elsif line.contains 'category'
  #         categories << Category.create(name: line)
  #       elsif line.contains 'tags'
  #         line.each do |tag|
  #           categories << Category.create(name: tag)
  #         end
  #       elsif '}'
  #         Quote.create(content: content, author: author, categories: categories)
  #         author = nil
  #         content = nil
  #         categories = []
  #       elsif '[' || ']'
  #         next
  #       else
  #         flash[:notice] = "can't parse that line"
  #       end
  #     end
  #   end
  # end
  def parseJson
    errors = []
    data = JSON.parse(params[:file].read)
    data.each do |quote_json|
      quote = Quote.new(
        content: quote_json['Quote'],
        author_id: extract_author(quote_json).id,
        category_ids: extract_categories(quote_json),
        popularity: quote_json['Popularity']
      )
      quote.save

      if quote.errors.any?
        quote.errors.full_messages.each do |msg|
          errors << msg
        end
      else
        # add quote in list success
      end
    end

    if !errors.empty?
      flash[:errors] = errors
    end
  end

  def extract_author(quote_json)
    full_name = quote_json['Author'].split(",").first
    Author.create_or_find_by_full_name(full_name)
  end

  def extract_categories(quote_json)
    category_ids = []
    category = Category.find_or_create_by(name: quote_json['Category'].downcase.strip)
    category_ids << category.id
    quote_json['Tags'].each do |tag_name|
      tag = Category.find_or_create_by(name: tag_name.downcase.strip)
      category_ids << tag.id
    end
    category_ids
  end

end
