class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def correct_user
    @items = current_user.items.find_by(id: params[:id])
      unless @items
        redirect_to root_url
      end
  end
end
