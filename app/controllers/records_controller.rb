class RecordsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_record, only: [:index, :create]
  before_action :prevent_url, only: :index

  def index
    @record_destination = RecordDestination.new
  end

  def create
    @record_destination = RecordDestination.new(recordDestination_params)
    if @record_destination.valid?
      pay_item
      @record_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_record
    @item = Item.find(params[:item_id])
  end

  def recordDestination_params
    params.require(:record_destination).permit(:post_code, :region_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: recordDestination_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    if @item.user_id == current_user.id  ||  @item.records.present?
      redirect_to root_path
    end
  end

end