class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def edit
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:item, :name, :introduce, :image, :category_id, :condition_id, :delivery_fee_id, :area_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
end