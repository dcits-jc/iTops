class Admin::WeekliesController < ApplicationController
  layout "admin"
  def show
    @user = User.find(params[:user_id])
    @weekly = Weekly.find(params[:id])
    @workflows = @weekly.workflows_group_by_project
  end

end
