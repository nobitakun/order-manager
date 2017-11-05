class ProjectsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @projects = Project.order('created_at DESC').page(params[:page])
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    
    if @project.save
      flash[:success] = '顧客登録しました'
      redirect_to @project
    else
      flash.now[:danger] = '顧客の登録に失敗しました'
      render :new
    end
  end

  def destroy
  end
  
  def orders
    @project = Project.find(params[:id])
    render 'orders'
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :current_postal_code, :postal_code, :adress, :current_adress, :phone, :current_phone, :owner_phone)
  end
end
