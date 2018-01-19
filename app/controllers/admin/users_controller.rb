class Admin::UsersController < ApplicationController
  layout "admin"
  

  def index
    @users = User.all
    @sbus = Sbu.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @weeklies = @user.weeklies.order_by_week
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = user.new(user_params)
    @user.create_currentweekly
    if @user.save
      flash[:notice] = '用户新建成功!'
      redirect_to admin_users_path
    else
      flash[:alert] = '用户新建失败'
      render :new    
    end
  end




  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = '用户新建成功!'
      redirect_to admin_users_path
    else
      flash[:alert] = '用户新建失败'
      render :new    
    end
  end




  def set_pm
    @user = User.find(params[:id])
    @user.pm = true
    @user.save
    redirect_to admin_users_path
  end

  def cancel_pm
    @user = User.find(params[:id])
    @user.pm = false
    @user.save
    redirect_to admin_users_path
  end

  def set_admin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    redirect_to admin_users_path
  end

  def cancel_admin
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
    redirect_to admin_users_path
  end



  private

  def user_params
    params.require(:user).permit(:code,:name,:itcode,:sbu,:phone,:title,:level,:cost)
  end

end
