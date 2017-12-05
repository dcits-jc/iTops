class WorkflowsController < ApplicationController

  def index
    
  end

  def new
    @project = Project.find(params[:project_id])
    @workflow = Workflow.new
  end


  def create
    @project = Project.find(params[:project_id])
    @workflow = Workflow.new(workflow_params)
    @workflow.project = @project
    @workflow.user = current_user
    if @workflow.save
      flash[:notice] = '报工成功!'
      redirect_to project_path(@project)
    else
      flash[:alert] = '报工失败'
      render :new    
    end
  end


  # 确认报工
  def confirm
    @project = Project.find(params[:project_id])
    @workflow = Workflow.find(params[:id])
    @workflow.confirm!
    redirect_to project_path(@project) 
  end


  private

  def workflow_params
    params.require(:workflow).permit(:name,:description,:hours)
  end

end
