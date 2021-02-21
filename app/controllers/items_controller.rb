class ItemsController < ApplicationController
  
  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :charge_burden_id, :prefecture_id, :price, :day_id, :image).merge(user_id: current_user.id)
  end
end
