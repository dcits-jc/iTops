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

end
