class SessionsController < ApplicationController

  def token
    user = User.authenticate(params[:email], params[:password])

    if user
      payload = { user: user.jwt_params }
      render json: { token: JWT.encode(payload, Rails.application.secrets.secret_key_base) }, status: 200
    else
      render json: {errors: ["Unauthorized"]}, status: 401
    end
  end

  def token_refresh
    logger.debug("/token_refresh reached")
    render json: {msg: "Unauthorized"}, status: 401
  end

end