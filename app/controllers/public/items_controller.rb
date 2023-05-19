class Public::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def genre_search
    @genre = Genre.find(params[:id])
    @items = @genre.items
    @genres = Genre.all
  end

end
