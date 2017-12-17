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
    @project = Project.find(workflow_params[:project_id])
    if @project.workflow_disabled?
      flash[:alert] = '报工失败,该项目已禁止报工!'
      redirect_to root_path 
    else
      @workflow = Workflow.new(workflow_params)
      @workflow.weekly = @weekly
      @workflow.user = current_user
      if @workflow.save
        if !@project.is_members?(current_user)
          @project.join!(current_user)
        end
        flash[:notice] = '报工成功!'
        redirect_to root_path
      else
        flash[:alert] = '报工失败'
        redirect_to root_path    
      end
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
    params.require(:workflow).permit(:name,:description,:hours,:project_id,:start_time,:end_time,:worktype,:remaining_issue)
  end

end
