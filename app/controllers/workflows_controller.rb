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

    @units = Unit.all

    @skills = Skill.all
    @companies = Company.all
    @select_projects = Project.pluck(:id,:name)

    @workflow_types = {}

    WorkflowType.find_each do |w|
     @workflow_types[w.name]=w.id.to_s
    end
    # @workflow_types = WorkflowType.all
  end


  def create
    # 如果工作时长或者内容为空,提示
    # 如果不为空->
      # 如果类型是部门工作,销售和项目号不用填
      # 如果销售名存在,则选个项目号
    # 工作时长与内容必填
    if workflow_params[:hours]==''
      flash[:alert] = '报工失败,未填写工作时长!'
      redirect_to root_path
    elsif workflow_params[:description]==''
      flash[:alert] = '报工失败,未填写工作内容!'
      redirect_to root_path
    else
      # 如果类型是部门工作,销售和项目号不用填
      if workflow_params[:workflow_type_id]=='15'
        # @project = Project.find_by_name('#部门工作#')
        @project = current_user.sbu_work
      elsif workflow_params[:workflow_type_id]=='11'
        # @project = Project.find_by_name('#认证考试#')
        @project = current_user.exam_work
      elsif workflow_params[:workflow_type_id]=='12'
        @project = current_user.tech_growth
      # 如果是休假
      elsif workflow_params[:workflow_type_id]=='16'
        @project = current_user.holiday
        # workflow_params[:description]='休假'
      end
      # binding.pry
      # 如果前面的判断没有类似情况
      if workflow_params[:project_id].blank? and @project.blank? 
        # 检查是否填写了项目号
        flash[:alert] = '报工失败,未填写项目号!'
        redirect_to root_path
      else
        # 如果没填写,就给个项目号
        @project ||= Project.find(workflow_params[:project_id])  
        # 找到指定的周
        @weekly = Weekly.find(params[:weekly_id])
        if @project.workflow_disabled?
          flash[:alert] = '报工失败,该项目已禁止报工!'
          redirect_to root_path 
        else
          @workflow = Workflow.new(workflow_params)
          @workflow.weekly = @weekly
          @workflow.user = current_user
          @workflow.project = @project
          # 如果没填写任何内容,就给个项目号
          # @workflow.description ||= '无内容'
          current_user.cost.present? ? current_cost = current_user.cost : current_cost = 0

          @workflow.cost = current_cost*@workflow.hours/8
          # 如果项目有销售名,就把销售名写入工作流
          if @project.sales_name.present? and @project.sales_name != '--'
            @workflow.project_sales = @project.sales_name
          end
          # binding.pry
          if @workflow.save
            if !@project.is_members?(current_user)
              @project.join!(current_user)
            end
            @project.addCost!(@workflow.cost)
            flash[:notice] = '报工成功!'
            redirect_to root_path
          else
            # binding.pry
            flash[:alert] = '报工失败'
            redirect_to root_path    
          end
        end
      end
    end
  end


  def destroy
    @weekly = Workflow.find(params[:id])
    if @weekly.destroy
      flash[:notice] = '工作流删除成功!'     
    else
      flash[:alert] = '工作流删除失败'
    end
    redirect_to root_path
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
    params.require(:workflow).permit(:description,:hours,:project_id,:start_time,:end_time,:remaining_issue,:workflow_type_id,:other_company,:other_skill,:project_name,:project_unit,:project_sales,company_ids: [],skill_ids: [])
  end

end
