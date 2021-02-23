class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :sets_item, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :charge_burden_id, :prefecture_id, :price, :day_id, :image).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def sets_item
    redirect_to root_path if @item.user != current_user
  end
end
