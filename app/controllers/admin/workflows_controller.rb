class Admin::WorkflowsController < ApplicationController
  layout "admin"
  def index
    @workflows = Workflow.all.order_by_created_at.paginate(:page => params[:page], :per_page => 30)
  end


end
