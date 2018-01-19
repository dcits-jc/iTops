class Admin::SbusController < ApplicationController
  layout "admin"

  def index
    @sbus = Sbu.all
  end

  def show
    @sbu = Sbu.find(params[:id])
    @users = User.where(sbu_name: @sbu.name)
  end

end
