class OrdersController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_partner_order_kana, only: [:new, :create, :edit, :copy]
  
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

  def new
    @project = Project.find(params[:id])
    @order = Order.new(project_id: @project.id)
    @order.line_items.build
  end
  
  def create
    @order = Order.new(order_params)
    @project = Project.find(order_params[:project_id])
    
    if @order.save
      flash[:success] = '発注書を登録しました'
      redirect_to orders_project_url(id: @order.project_id)
    else
      flash.now[:danger] = '発注書の登録に失敗しました'
      render :new
    end
  end
  
  def edit
    @project = Project.find(@order.project_id)
  end
  
  def update
    @project = Project.find(order_params[:project_id])
    if @order.update(order_params)
      flash[:success] = '発注書を編集しました'
      redirect_to orders_project_url(id: @order.project_id)
    else
      flash.now[:danger] = '発注書の編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @order.destroy
    flash[:success] = '発注書を削除しました'
    redirect_to orders_project_url(id: @order.project_id)
  end
  
  private
  
  def set_order
     @order = Order.find(params[:id])
  end
  
  def set_partner_order_kana
    @partner = Partner.order(:kana)
  end
  
  def order_params
    params.require(:order).permit(:name, :document_date, :project_id, :partner_id, :destination, :staff, :remark)
  end
  
end
