class OrderListsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_order_list, only: [:show, :edit, :update, :destroy, :copy]
  
  def index
  end

  def show
  end

  def new
    @project = Project.find(params[:id])
    @order_list = OrderList.new(project_id: @project.id)
    @order_list.line_items.build
  end
  
  def create
    @order_list = OrderList.new(order_list_params)
    @project = Project.find(order_list_params[:project_id])
    
    if @order_list.save
      flash[:success] = 'オーダーリストを登録しました'
      redirect_to order_lists_project_url(id: @order_list.project_id)
    else
      flash.now[:danger] = 'オーダーリストの登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @project = Project.find(@order_list.project_id)
  end
  
  def update
    @project = Project.find(order_list_params[:project_id])
    if @order_list.update(order_list_params)
      flash[:success] = 'オーダーリストを編集しました'
      redirect_to order_lists_project_url(id: @order_list.project_id)
    else
      flash.now[:danger] = 'オーダーリストの編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @order_list.destroy
    flash[:success] = 'オーダーリストを削除しました'
    redirect_to order_lists_project_url(id: @order_list.project_id)
  end
  
  def copy_set
    @old_order_list =  OrderList.find(params[:id])
    @line_items = @old_order_list.line_items
    @project = Project.find(@old_order_list.project_id)
    @order_list =  OrderList.new(name: @old_order_list.name + "~コピー", project_id: @old_order_list.project_id)
    # @line_items.each do |item|
    #   item.id = nil
    #   item.order_list_id = @order_list.id
    #   item = item.attributes.compact
    #   LineItem.create!(item)
    # end
  end
  
  def copy
    @old_order_list =  OrderList.find(params[:id])
    @line_items = @old_order_list.line_items
    @order_list = OrderList.new(order_list_params)
    if @order_list.save
      @line_items.each do |item|
        item.id = nil
        item.order_list_id = @order_list.id
        item = item.attributes.compact
        LineItem.create!(item)
      end
      flash[:success] = 'オーダーリストを複製しました'
      redirect_to order_lists_project_url(@order_list.project_id)
    else
      flash.now[:danger] = 'オーダーリストの複製に失敗しました'
      render :copy_set
    end
  end
  
  def ajax_calc_subtotal
    if params[:value].present?
      @items = Item.where(item_category_id: params[:value])
    else
      @items = Item.all
    end
    
    @target_id = params[:tar_id]
  end
  
  private
  
  def set_order_list
    @order_list = OrderList.find(params[:id])
  end
  
  def order_list_params
    params.require(:order_list).permit(:name, :project_id, line_items_attributes: [:id, :quantity, :delivery_date, :remark, :item_id, :paid, :unit_price])
  end
end
