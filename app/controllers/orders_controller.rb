class OrdersController < ApplicationController
  def index
    #@item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
   params.require(:user_order).permit(:postal_code, :prefecture, :municipalities, :address, :building_number, :phone_number, :purchase_id)
  end
end