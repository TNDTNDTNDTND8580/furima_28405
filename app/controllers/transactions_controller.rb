class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
end
