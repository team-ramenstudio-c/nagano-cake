class ApplicationController < ActionController::Base
before_action :search

  def search
    @q = Item.ransack(params[:q])
    @item = @q.result
  end
end
