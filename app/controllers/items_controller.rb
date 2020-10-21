class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit]

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
  end
  private

  def item_params
    params.require(:item).permit(:item_name, :item_explanation, :item_category_id, :item_status_id,
                                 :delivery_charge_id, :delivery_area_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
