class SbusController < ApplicationController

  def index
    @sbus = current_user.manager_sbus
  end

  def show
    @sbu = Sbu.find(params[:id])
    @users = User.where(sbu_name: @sbu.name)
    @workflows_xls = Workflow.includes(:weekly).includes(:user).where(users: {sbu_name: @sbu.name}).order("workflows.created_at DESC")
    @workflows = @workflows_xls.paginate(:page => params[:page], :per_page => 30)

    
    respond_to do |format|
      format.html
      # format.csv { send_data @workflows.to_csv }
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=\"" + @sbu.name + ".xls\""
      }  
       # { send_data @products.to_csv(col_sep: "\t") }
    end

  end

end
