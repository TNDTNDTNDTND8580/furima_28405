class TransactionsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
end
