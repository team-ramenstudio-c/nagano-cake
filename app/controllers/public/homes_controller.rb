class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.limit(4).order(created_at: :DESC)
  end

  def about
  end
end
