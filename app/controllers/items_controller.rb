class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  # before_action :move_to_index, except: :index  LGTMがもらえたら、削除する

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :category_id, :condition_id, :postage_id, :region_id, :shopping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  # def move_to_index  LGTMがもらえたら、削除する
  #   unless user_signed_in?
  #     redirect_to new_user_session_path
  #   end
  # end

end