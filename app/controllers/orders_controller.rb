class OrdersController < ApplicationController
  before_action :require_user_logged_in
  
  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @project = Project.find(params[:id])
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
    
    if @order.save
      flash[:success] = '発注書を登録しました'
      redirect_to @order
    else
      flash.now[:danger] = '発注書の登録に失敗しました'
      render :new
    end
  end
  
  def copy
  end
  
  private
   
  def order_params
    params.require(:order).permit(:document_date, :project_id, :partner_id)
  end
  
end
