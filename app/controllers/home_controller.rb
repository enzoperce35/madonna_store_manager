class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def unit_chart
  end
end
