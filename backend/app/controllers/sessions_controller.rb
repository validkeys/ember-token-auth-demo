class SessionsController < ApplicationController

  skip_before_filter :authenticate!, only: [:token]

  def token
    user = User.authenticate(params[:email], params[:password])
    if user
      set_current_user user
      generated_token = generate_token(user)
      render json: { token: generated_token[:token], exp: generated_token[:payload][:exp] }, status: 200
    else
      render json: {errors: ["Unauthorized"]}, status: 401
    end
  end

  def token_refresh
    logger.debug("/token_refresh reached")
    render json: {msg: "Unauthorized"}, status: 401
  end

  private

  def generate_token(user)
    payload = { user: user.jwt_params, exp: 30.days.from_now.to_i }
    {
      token:    JWT.encode(payload, Rails.configuration.secret_token),
      payload:  payload
    }
  end

end