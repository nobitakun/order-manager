class PartnersController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  
  def index
    @partners = Partner.order('created_at DESC').page(params[:page])
  end

  def show
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
  
  def edit
  end
  
  def update
    if @partner.update(partner_params)
      flash[:success] = '発注先を編集しました'
      redirect_to @partner
    else
      flash.now[:danger] = '発注先の編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @partner.destroy
    flash[:success] = '発注先を削除しました'
    redirect_to partners_url
  end
  
  private
  
  def set_partner
    @partner = Partner.find(params[:id])
  end
  
  def partner_params
    params.require(:partner).permit(:name, :adress, :phone, :fax, :staff, :staff_phone, :postal_code)
  end
  
end
