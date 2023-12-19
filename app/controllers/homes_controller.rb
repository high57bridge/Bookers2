class HomesController < ApplicationController
  def top
    @users = User.find(params[:id])
    @user = current_user
  end

  def about
  end
end
