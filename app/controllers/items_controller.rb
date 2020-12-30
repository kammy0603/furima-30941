class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
  @item = Item.new
  end

  def create
  @items = Item.create(item_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  # def destroy
  # end
  private

  def message_params
    params.require(:item).permit(:image, :name, :introduction, :category_id, :item_status_id, :distribution_fee_id, :region_id, :distribution_term_id, :price, :genre_id, :status_id, :distribution_id, :region_genre_id, :term_id).merge(user_id: current_user.id)
  end

end
