class ApplicationController < ActionController::Base

  before_filter :authenticate!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate!
    begin
      token = request.headers['Authorization'].split(' ').last
      JWT.decode(token, Rails.configuration.secret_token)
    rescue JWT::ExpiredSignature
      puts "Signature has expired"
    rescue JWT::DecodeError
      render json: {error: "There was a problem decoding your JWT"}, status: 500
    end
  end
end
