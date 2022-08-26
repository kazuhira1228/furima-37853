class ItemsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    # @item = Item.all  補足：商品一覧機能の実装で記述する部分。
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

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end