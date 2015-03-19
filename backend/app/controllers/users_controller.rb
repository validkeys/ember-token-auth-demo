class UsersController < ApplicationController

  include EmberTokenAuth::UsersController

  def show
    @user = User.find(params[:id])
    render json: @user, status: 200
  end

  def user_params
    params.require(:user)
      .permit(:name, :email, :password)
  end
  hide_action :user_params

end
