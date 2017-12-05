class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.members << current_user
    @project.managers << current_user
    if @project.save
      flash[:notice] = '项目新建成功!'
      redirect_to project_path(@project)
    else
      flash[:alert] = '项目新建失败'
      render :new    
    end    
  end



  def invite
    @project = Project.find(params[:id])
  end

  # 加入项目
  def join_in
    @project = Project.find(params[:id])
    if @project.is_members?(current_user)
      flash[:warning] = '你已经在该项目中!'
    else
      @project.join!(current_user)
      flash[:success] = '成功加入该项目!'
    end
    redirect_to project_path(@project)
  end

  # 拒绝加入项目
  def refuse
    @project = Project.find(params[:id])
    redirect_to :root
  end

  private

  def project_params
    params.require(:project).permit(:name,:description)
  end


end
