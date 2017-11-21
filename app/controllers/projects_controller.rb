class ProjectsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_project, only: [:show, :edit, :update, :destroy, :orders]
  
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
      flash.now[:danger] = '顧客の登録に失敗しました'
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
      flash.now[:danger] = '顧客の編集に失敗しました'
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
  
  private
  
  def set_project
    @project = Project.find(params[:id])
  end
  
  def project_params
    params.require(:project).permit(:name, :current_postal_code, :postal_code, :adress, :current_adress, :phone, :current_phone, :owner_phone, :remark)
  end
end
