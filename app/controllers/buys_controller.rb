class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :correct_user, only: :index
  def index
    @item = Item.find(params[:item_id])
    @purchase = AdressBuy.new
  end

  def correct_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = AdressBuy.new(buy_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buy_params
    params.permit(:area_id, :token, :item_id, :prefecture, :city, :postal_code, :building, :adress, :phon_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
