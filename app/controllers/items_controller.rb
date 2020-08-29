class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show, :edit, :destroy, :pay]
  before_action :authenticate_user!, only: [:edit, :destroy, :new, :create, :pay]
  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

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
      render 'new'
    end

  end

  def edit
    
  end

  def destroy
    
  end

  def pay
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def item_params
    params.require(:item).permit(:item, :name, :introduce, :image, :category_id, :condition_id, :delivery_fee_id, :area_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
  def ensure_current_user
    item = Item.find(params[:id])
    if item.user_id != current_user.id
      redirect_to action: :index
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end
end