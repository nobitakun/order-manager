class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_item, only: [:edit, :update, :destroy]
  
  def index
    @items = Item.order('id DESC').page(params[:page])
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
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @item.update(item_params)
      flash[:success] = '部材を編集しました'
      redirect_to items_url
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url
  end
  
  def ajax_select
    if params[:value].present?
      @items = Item.where(item_category_id: params[:value])
    else
      @items = Item.all
    end
    
    @line_item_object_id = params[:line_item_object_id]
  end
  
  private
  
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :price, :unit, :item_category_id)
  end
  
  
end
