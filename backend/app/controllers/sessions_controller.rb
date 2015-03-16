class SessionsController < ApplicationController

  def token
    user = User.authenticate(params[:email], params[:password])
    puts params
    if user
      render json: user, status: 200
    else
      render json: {errors: ["Unauthorized"]}, status: 401
    end
  end

  def token_refresh
    logger.debug("/token_refresh reached")
    render json: {msg: "Unauthorized"}, status: 401
  end

end