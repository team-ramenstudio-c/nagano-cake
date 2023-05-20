class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_item_path(@item.id)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_image,:genre_id,:name,:description,
                                 :price_without_tax,:is_on_sale)
  end
  
end
