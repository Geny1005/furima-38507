class ItemsController < ApplicationController

  def index
  end

  def new
    @items = Item.new
  end

  def create
    @items = Items.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).parmit(:name, :information, :categry_id, :condition_id, :delivery_burden_id, :sender_area_id, :schedule_id, :price).merge(user_id: current_user.id)
    

end
