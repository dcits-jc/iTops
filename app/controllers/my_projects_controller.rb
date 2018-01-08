class MyProjectsController < ApplicationController

  def index
    @projects = current_user.manage_projects
  end


  def show
    @project = Project.find(params[:id])
    @workflows = @project.workflows_group_by_project
    @workflow_user_groups = @project.workflows_group_by_user
  end

end
