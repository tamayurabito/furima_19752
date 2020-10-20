class PurchaceController < ApplicationController
  def index
  end
    @purchace = PurchaceAddress.new(postal_code: purchace_params[:postal_code], delivery_area_id: purchace_params[:delivery_area_id], citys: purchace_params[:citys], 
      addresses: purchace_params[:addresses], building_name: purchace_params[:building_name], phone_number: purchace_params[:phone_number], item_id: purchace_params[:item_id], user_id: purchace_params[:user_id])
end
