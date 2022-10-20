class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @order_address = OrderAddress.new
    item_data
    if @item.order.present? || @item.user == current_user
      redirect_to root_path
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    item_data
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :sender_area_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def  item_data
    @item = Item.find(params[:item_id])
  end

end
