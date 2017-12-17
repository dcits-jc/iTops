class ProjectsController < ApplicationController
  layout "user"

  before_action :current_week

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
      redirect_to admin_projects_path
    else
      flash[:alert] = '项目新建失败'
      render :new    
    end    
  end


  # 邀请加入
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


  # 邀请管理
  def invite_manager
    @project = Project.find(params[:id])
  end

  # 加入项目管理
  def manage_in
    @project = Project.find(params[:id])
    if @project.is_managers?(current_user)
      flash[:warning] = '你已经在该项目中!'
    else
      @project.join!(current_user)
      @project.join_manager!(current_user)
      flash[:success] = '成功加入该项目!'
    end
    redirect_to project_path(@project)
  end



  # 拒绝加入项目
  def refuse
    @project = Project.find(params[:id])
    flash[:success] = '您拒绝了加入'+@project.name+'项目的邀请!'
    redirect_to :root
  end



  # 拒绝加入项目
  def refuse
    @project = Project.find(params[:id])
    flash[:success] = '您拒绝了加入'+@project.name+'项目的邀请!'
    redirect_to :root
  end

  private

  def project_params
    params.require(:project).permit(:code,:name,:description,:sales_name,:sbu,:project_type,:start_time,:end_time)
  end

  def current_week
    @current_weekly = current_user.weeklies.last
    @start_time =@current_weekly.start_time.strftime("%Y-%m-%d")
    @end_time =@current_weekly.end_time.strftime("%Y-%m-%d")
  end

end
