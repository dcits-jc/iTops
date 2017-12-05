class Admin::ProjectsController < ApplicationController
  layout "admin"
  def index
    @projects = Project.all
  end

end
