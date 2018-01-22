class Admin::ProjectsController < ApplicationController
  layout "admin"
  def index
    @projects = Project.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
     @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # @project.members << current_user
    # @project.managers << current_user
    if @project.save
      flash[:notice] = '项目新建成功!'
      redirect_to admin_project_path(@project)
    else
      flash[:alert] = '项目新建失败'
      render :new    
    end    
  end




  def show
    @project = Project.find(params[:id])
    @project_sum_hours = @project.hours_sum
    @workflow_user_groups = @project.workflows_group_by_user
  end

  def edit
    @project = Project.find(params[:id])
  end


  # 禁止报工
  def disable_workflow
    @project = Project.find(params[:id])
    @project.workflow_disabled!
    redirect_to admin_project_path(@project)
  end

  # 重新开启报工
  def enable_workflow
    @project = Project.find(params[:id])
    @project.workflow_enabled!
    redirect_to admin_project_path(@project)
  end


  
  private

  def project_params
    params.require(:project).permit(:code,:name,:description,:sales_name,:cost_plan,:sbu,:project_type,:start_time,:end_time)
  end



end
