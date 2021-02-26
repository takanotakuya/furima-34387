class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @order_buyer = OrderBuyer.new
  end

  def create
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect
    redirect_to root_path if @item.user == current_user || @item.order.present?
  end
end
