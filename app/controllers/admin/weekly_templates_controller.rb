class Admin::WeeklyTemplatesController < ApplicationController

  layout "admin"

  def index
    @weekly_templates = WeeklyTemplate.all
  end

  def show
    @weekly_template = WeeklyTemplate.find(params[:id])
    @weeklies = @weekly_template.weeklies
    @workflows = []
    @weeklies.each do |week|
      week.workflows.each do |workflow|
        @workflows.push(workflow)
      end
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
