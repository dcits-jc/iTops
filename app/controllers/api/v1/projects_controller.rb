class Api::V1::ProjectsController < ApiController

  def show
    @project = Project.find_by_code(params[:project_code])

    if @project.present?
      # 如果该项目已经停止报工提示下
      if @project.workflow_disabled?
        render json: {
          stat: 2,
          data:{
            id: @project.id,
            code: @project.code,
            name: @project.name,
            project_type: @project.project_type,
            sbu: @project.sbu,
            sales_name: @project.sales_name
          }
        }   
      else
        render json: {
          stat: 1,
          data:{
            id: @project.id,
            code: @project.code,
            name: @project.name,
            project_type: @project.project_type,
            sbu: @project.sbu,
            sales_name: @project.sales_name
          }
        }        
      end
    else
      render json: {
        stat: 0
      }  
    end
  end

end
