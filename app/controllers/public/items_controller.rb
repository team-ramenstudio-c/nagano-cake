class Public::ItemsController < ApplicationController
  before_action :all_genre

  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  def genre_search
    @genre = Genre.find(params[:id])
    @items = @genre.items
  end


  private

  def all_genre
     @genres = Genre.all
  end

  def item_params
    params.require(:item).permit(:genre_id, :name, :description, :price_without_tax, :is_on_sale)
  end

end
