class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top_another_user, only: [:edit, :destroy]
  before_action :move_to_top_already_purchased, only: [:edit, :destroy]

  def index
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :show, id: @item.id
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :item_category_id, :item_status_id,
                                 :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top_another_user
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def move_to_top_already_purchased
    redirect_to root_path if @item.purchace.present?
  end

end
