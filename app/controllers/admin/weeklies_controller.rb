class Admin::WeekliesController < ApplicationController
  layout "admin"
  def show
    @user = User.find(params[:user_id])
    @weekly = Weekly.find(params[:id])
    @workflows = @weekly.workflows_group_by_project


    @workflows_order_project = @weekly.workflows.order_by_project_id
    
    respond_to do |format|
      format.html
      # format.csv { send_data @workflows.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end


  end

end
