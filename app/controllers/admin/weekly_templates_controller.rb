class Admin::WeeklyTemplatesController < ApplicationController

  layout "admin"

  def index
    @weekly_templates = WeeklyTemplate.all
  end

  def show
    @weekly_template = WeeklyTemplate.find(params[:id])
    @weeklies = @weekly_template.weeklies.includes(:user)


    # 所有的 workflows 筛选出此周匹配的的
    @workflows = Workflow.includes(:weekly).includes(:user).where(weeklies: {year: @weekly_template.year,week: @weekly_template.week})

    @workflows_user = @workflows.order_by_user_id

    respond_to do |format|
      format.html
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=\""+ 'Y'+@weekly_template.year.to_s+'-W'+@weekly_template.week.to_s+".xls" +  "\""
      }  
      # { send_data @products.to_csv(col_sep: "\t") }
    end
    
  end

  def new
    @weekly_template = WeeklyTemplate.new
  end

  def create
    @weekly_template = WeeklyTemplate.new(weekly_template_params)

    if @weekly_template.save
      @weekly_template.create_weeklies!
      flash[:notice] = '新周报模板创建成功!'
      redirect_to admin_weekly_templates_path
    else
      flash[:alert] = '新周报模板创建失败'
      render :new    
    end
  end

  private

  def weekly_template_params
    params.require(:weekly_template).permit(:year,:month,:week,:start_time,:end_time)
  end
end
