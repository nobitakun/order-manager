class PartnersController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @partners = Partner.order('created_at DESC').page(params[:page])
  end

  def show
    @partner = Partner.find(params[:id])
  end
  
  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    
    if @partner.save
      flash[:success] = '発注先を登録しました'
      redirect_to @partner
    else
      flash.now[:danger] = '発注先の登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def partner_params
    params.require(:partner).permit(:name, :adress, :phone, :fax, :staff, :staff_phone, :postal_code)
  end
  
end
