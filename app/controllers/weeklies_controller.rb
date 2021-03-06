class WeekliesController < ApplicationController
  layout "user"

  before_action :current_week
  def index
    @weeklies = current_user.weeklies.order_by_created_at
  end


  def show
    @weekly = Weekly.find(params[:id])
    @workflows = @weekly.workflows_group_by_project

    @simple_workflows = @weekly.workflows

    respond_to do |format|
      format.html
      # format.csv { send_data @workflows.to_csv }
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]= "attachment; filename=Y" + @weekly.year.to_s + "W" + @weekly.week.to_s + "_周报导出.xls"
      }  
    end


  end

  def edit
    @weekly = Weekly.find(params[:id])
    @workflows = @weekly.workflows
  end

  def update
    @weekly = Weekly.find(params[:id])
    @weekly.update(weekly_params)
    if @weekly.save
      flash[:notice] = '报工成功!'
      redirect_to weekly_path(@weekly)
    else
      flash[:alert] = '报工失败'
      render :new    
    end    
  end

  # def new
  #   @weekly = Weekly.new
  # end

  # def create
  #   @weekly = Weekly.find(params[:id])
  #   @weekly = Weekly.new(weekly_params)
  #   @weekly.user = current_user
  #   if @workflow.save
  #     flash[:notice] = '报工成功!'
  #     redirect_to weekly_path(@weekly)
  #   else
  #     flash[:alert] = '报工失败'
  #     render :new    
  #   end
  # end


  def this_week
    @user = current_user
    if current_user.weeklies.blank?
      current_user.create_currentweekly!
    end
    
    @current_weekly = current_user.weeklies.last
    @workflow = Workflow.new
    
    @workflows = @current_weekly.workflows_group_by_project

    @workload_sum = @current_weekly.workload_sum

    @projects = Project.all

    @units = Unit.all
    sum_workhours = 0
    @current_weekly.workflows.each do |workflow|
      sum_workhours = sum_workhours + workflow.hours
    end
    @current_weekly_workhours = sum_workhours
  end



  private

  def weekly_params
    params.require(:weekly).permit(:week,:year)
  end

  def current_week
    if current_user.weeklies.blank?
      current_user.create_currentweekly!
    end
    @current_weekly = current_user.weeklies.last
    @start_time =@current_weekly.start_time.strftime("%Y-%m-%d")
    @end_time =@current_weekly.end_time.strftime("%Y-%m-%d")

  end

end
