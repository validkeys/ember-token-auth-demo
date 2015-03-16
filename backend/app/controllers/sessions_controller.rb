class SessionsController < ApplicationController

  def token
    logger.debug("/token reached")
    render json: {msg: "Unauthorized"}, status: 401
  end

  def token_refresh
    logger.debug("/token_refresh reached")
    render json: {msg: "Unauthorized"}, status: 401
  end

end