class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :url_direct_hit_prevention, only: :edit     # 学習用メモ：def edit 〜 end より先に、このコードが読み込まれる。

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  # def destroy
  #   @item = Item.find(params[:id])
  # end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :category_id, :condition_id, :postage_id, :region_id, :shopping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def url_direct_hit_prevention
    @item = Item.find(params[:id])
    if @item.user.id != current_user.id
      redirect_to root_path
    end
  end

end