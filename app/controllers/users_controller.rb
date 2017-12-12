class UsersController < ApplicationController
  layout "user"

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end






  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = '用户信息更新成功!'
      redirect_to user_path(current_user)
    else
      flash[:alert] = '用户信息更新失败'
      render :new    
    end
  end


  private

  def user_params
    params.require(:user).permit(:code,:name,:itcode,:sbu,:phone,:title,:level,:cost)
  end


end
