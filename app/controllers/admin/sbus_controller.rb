class Admin::SbusController < ApplicationController
  layout "admin"

  def index
    @sbus = Sbu.all
  end




  def show
    @sbu = Sbu.find(params[:id])
    @users = User.where(sbu_name: @sbu.name)

    respond_to do |format|
      format.html
      # format.csv { send_data @workflows.to_csv }
      format.xls{ 
        # 设置文件名
        headers["Content-Disposition"]="attachment; filename=\"" + @sbu.name + "\""
      }  
       # { send_data @products.to_csv(col_sep: "\t") }
    end

  end



  def update
    @sbu = Sbu.find(params[:id])
    user = User.find(sbu_params[:sbu_managers])
    @sbu.add_manager!(user)
    redirect_to admin_sbus_path(@sbu)
  end

  private

  def sbu_params
    params.require(:sbu).permit(:id,:sbu_managers)
  end


end
