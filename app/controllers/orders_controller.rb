class OrdersController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_order, only: [:show, :edit, :update, :destroy, :document]
  
  def index
  end

  def show
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
  
  def document
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
  end
  
  def create
    @order = Order.new(only_order_params)
    @project = Project.find(order_params[:project_id])
    
    if @order.save && @order.update(order_params)
      flash[:success] = '発注書を登録しました'
      redirect_to order_lists_project_url(id: @order.project_id)
    else
      render :new
    end
  end
  
  def edit
    @project = Project.find(@order.project_id)
  end
  
  def update
    @project = Project.find(order_params[:project_id])
    @line_items = LineItem.where(id: order_params[:line_item_ids])
    if @order.update(order_params)
      flash[:success] = '発注書を編集しました'
      redirect_to @order
    else
      render :edit
    end
  end
  
  def destroy
    @order.destroy
    flash[:success] = '発注書を削除しました'
    redirect_to order_lists_project_url(id: @order.project_id)
  end
  
  private
  
  def set_order
     @order = Order.find(params[:id])
  end
  
  def order_params
    params.require(:order).permit(:name, :document_date, :project_id, :destination, :staff, :remark, :discount, { line_item_ids: []})
  end
  
  def only_order_params
    params.require(:order).permit(:name, :document_date, :project_id, :destination, :staff, :remark, :discount)
  end
end
