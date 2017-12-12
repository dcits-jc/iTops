class WorkflowsController < ApplicationController
  layout "user"
  def index
    
  end

  def new
    @weekly = Weekly.find(params[:weekly_id])
    # @project_names = []
    # current_user.projects.each do |project|
    #   @project_names.push(project.code+'#'+project.name+'#'+project.sales_name+'#'+project.sbu+'#')
    # end
    @workflow = Workflow.new

    @skills = Skill.all
    @companies = Company.all
  end


  def create
    @weekly = Weekly.find(params[:weekly_id])
    @workflow = Workflow.new(workflow_params)
    @workflow.weekly = @weekly
    @workflow.user = current_user
    if @workflow.save
      flash[:notice] = '报工成功!'
      redirect_to edit_weekly_path(@weekly)
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
    flash[:notice] = '该工作量已确认!'
    redirect_to project_path(@project) 
  end


  private

  def workflow_params
    params.require(:workflow).permit(:name,:description,:hours,:project_id,:begin_time,:end_time,:worktype,:remaining_issue)
  end

end
