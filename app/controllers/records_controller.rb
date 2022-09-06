class RecordsController < ApplicationController

  def index
    @record_destination = RecordDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @record_destination = RecordDestination.new(recordDestination_params)
    @item = Item.find(params[:item_id])
    if @record_destination.valid?
     @record_destination.save
     redirect_to root_path
    else
     render :index
    end
  end

  private

  def recordDestination_params
    params.require(:record_destination).permit(:post_code, :region_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
