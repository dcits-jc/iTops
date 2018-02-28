class Api::V1::UsersController < ApplicationController

  # 检索正式项目
  def normal
    @users = User.search_normal(params[:itcode])

    if @users.present?
      render json: {
          stat: 1,
          data: @users.map{ |user|

            {
              id: user.id,
              itcode: user.itcode,
              sbu_name: user.sbu_name,
              title: user.title,
              name: user.name
            }
          }
        }  
    else
      render json: {
        stat: 0,
        data: []
      }  
    end  

  end

end
