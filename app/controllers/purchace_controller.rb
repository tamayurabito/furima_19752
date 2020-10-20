class PurchaceController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_login, only: [:index]
  before_action :move_to_top_same_user, only: [:index]
  before_action :move_to_top_already_purchased, only: [:index]

  def index
  end

  def create
    @purchace = PurchaceAddress.new(purchace_params)
    if @purchace.valid?
      pay_item
      @purchace.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchace_params
    params.permit(:token, :postal_code, :delivery_area_id, :citys, :addresses, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item[:price], # 商品の値段
      card: purchace_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top_same_user
    redirect_to controller: :items, action: :index if @item.user_id == current_user.id
  end

  def move_to_top_already_purchased
    redirect_to controller: :items, action: :index if @item.purchace.present?
  end
end
