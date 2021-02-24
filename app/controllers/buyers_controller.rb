class BuyersController < ApplicationController
  def create
    @buyer = Buyer.new((buyer_params))
    @item = Item.find(params[:item_id])
  end
end
