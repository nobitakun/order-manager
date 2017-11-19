class OrdersController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  end

  def show
    @order = Order.find(params[:id])
    @line_item_total = 0
    @order.line_items.each do | line_item |
      @line_item_total += line_item.quantity * line_item.item.price
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'detail',                       
               encording: 'UTF-8',                  
               layout: 'pdf.html',                  
               show_as_html: params[:debug].present?
      end
    end
  end

  def new
    @project = Project.find(params[:id])
    @order = Order.new(project_id: @project.id)
    @partner = Partner.order(:kana)
    @order.line_items.build
    @item_categories = ItemCategory.all
    @items = Item.all
    # @user = User.all
  end
  
  def create
    @order = Order.new(order_params)
    @project = Project.find(order_params[:project_id])
    @items = Item.all
    @item_categories = ItemCategory.all
    
    if @order.save
      flash[:success] = '発注書を登録しました'
      redirect_to @order
    else
      flash.now[:danger] = '発注書の登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @order = Order.find(params[:id])
    @project = Project.find(@order.project_id)
    @partner = Partner.order(:kana)
    @items = Item.all
    # @user = User.all
  end
  
  def update
    @order = Order.find(params[:id])
    @project = Project.find(order_params[:project_id])
    @items = Item.all
    if @order.update(order_params)
      flash[:success] = '発注書を編集しました'
      redirect_to @order
    else
      flash.now[:danger] = '発注書の編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = '発注書を削除しました'
    redirect_to project_url
  end
  
  def copy
    @old_order =  Order.find(params[:id])
    @line_items = @old_order.line_items
    @project = Project.find(@old_order.project_id)
    # @order = Marshal.load(Marshal.dump(@old_order))
    @order =  @old_order.deep_dup
    # @order.line_items.build
    @items = Item.all
  end
  
  private
   
  def order_params
    params.require(:order).permit(:name, :document_date, :project_id, :partner_id, :destination, :staff, line_items_attributes: [:id, :quantity, :delivery_date, :remark, :item_id, :paid])
  end
  
end
