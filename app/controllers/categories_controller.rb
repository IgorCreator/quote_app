class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def new

  end

  def index

  end

  def show

  end
end
