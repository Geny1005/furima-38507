class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only:[:show, :edit, :update, :destroy]


  def index
    @items = Item.all.order("created_at DESC")
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
    if @item.order.present? || @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.order.present? || @item.user != current_user
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end


  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :condition_id, :delivery_burden_id, :sender_area_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end

end