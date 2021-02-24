class OrdersController < ApplicationController
  def index
    @orders = Order.new
    @item = Item.find(params[:item_id])
  end
end
