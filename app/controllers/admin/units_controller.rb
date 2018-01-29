class Admin::UnitsController < ApplicationController

  def index
    @unites= Unit.all
  end


end
