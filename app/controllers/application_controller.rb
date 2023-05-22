class ApplicationController < ActionController::Base
before_action :search

  def search
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)

    # @results =
    # if params[:q].empty?
    # Item.none
    # else
    # @q.result(distinct: true)
    # end
  end
end
