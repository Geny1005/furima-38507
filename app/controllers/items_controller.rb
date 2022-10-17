class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  private

  before_action : @item = Item.find(params[:id]), only [:show, :edit, :update]

  def item_params
    params.require(:item).permit(:name, :information, :category_id, :condition_id, :delivery_burden_id, :sender_area_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end

end
