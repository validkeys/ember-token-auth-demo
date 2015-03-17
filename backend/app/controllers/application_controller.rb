class ApplicationController < ActionController::Base

  before_filter :authenticate!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  def decoded_token
    JWT.decode(http_auth_header, Rails.configuration.secret_token, true, {leeway: 10})    
  end
  hide_action :decoded_token

  def set_current_user(user)
    @current_user ||= user
  end
  hide_action :set_current_user

  private

  def http_auth_header
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    else
      nil
    end
  end

  def set_current_user_from_token(token)
    set_current_user User.find(token[0]["user"]["id"])
  end

  def authenticate!
    begin
      set_current_user_from_token(decoded_token)
    rescue JWT::ExpiredSignature
      render json: {error: "JWT Expired"}, status: 401
    rescue JWT::DecodeError
      render json: {error: "JWT Decode Error"}, status: 401
    end
  end
end
