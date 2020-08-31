class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def correct_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
