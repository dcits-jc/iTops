class WeekliesController < ApplicationController
  layout "user"
  def index
    @weeklies = current_user.weeklies
  end


  def show
    @weekly = Weekly.find(params[:id])
    @workflows = @weekly.workflows
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

  private

  def weekly_params
    params.require(:weekly).permit(:week,:year)
  end

end
