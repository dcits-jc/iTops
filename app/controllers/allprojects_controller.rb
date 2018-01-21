class AllprojectsController < ApplicationController

  # 遍历全部 projects
  def index
    @projects = Project.all
  end

end
