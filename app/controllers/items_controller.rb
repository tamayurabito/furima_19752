class ItemsController < ApplicationController

  def index
    @items = Item.order('id DESC')
  end

  def new
    @item = Item.new
  end

end
