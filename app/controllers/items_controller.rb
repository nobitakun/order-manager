class ItemsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @items = Item.order('created_at DESC').page(params[:page])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = '部材を登録しました'
      redirect_to items_url
    else
      flash.now[:danger] = '部材の登録に失敗しました'
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    
    flash[:success] = '部材を削除しました'
    redirect_to items_url
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :price, :unit, :item_category_id)
  end
  
  
end
