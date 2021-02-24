class OrdersController < ApplicationController
  def index
    @orders = Order.new
    @order_buyer = OrderBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

# index -> index.html.erb(@item)
# create redirect_to root_path -> items/index -> items/index.html.erb(@items)
# create render :index -> index.html.erb(@item, @order_buyer)