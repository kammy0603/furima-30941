class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.new
    redirect_to root_path if current_user.id != @item.user_id
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
   params.require(:user_order).permit(:postal_code, :prefecture, :municipalities, :address, :building_number, :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end