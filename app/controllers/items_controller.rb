class ItemsController < ApplicationController
  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end

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