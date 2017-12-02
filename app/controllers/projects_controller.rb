class ProjectsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_project, only: [:show, :edit, :update, :destroy, :orders, :order_lists]
  
  def index
    @projects = Project.order('created_at DESC').page(params[:page])
  end
  
  def show
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
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @project.update(project_params)
      flash[:success] = '顧客を編集しました'
      redirect_to @project
    else
      render :edit
    end
  end
  
  def destroy
    @project.destroy
    flash[:success] = '顧客を削除しました'
    redirect_to projects_url
  end
  
  def orders
  end
  
  def order_lists
  end
  
  private
  
  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params
    params.require(:project).permit(:code, :name, :current_postal_code, :postal_code, :adress, :current_adress, :phone, :current_phone, :owner_phone, :remark, :recipt, :contract_date, :finish_date)
  end
end
