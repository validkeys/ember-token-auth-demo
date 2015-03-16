class User < ActiveRecord::Base
  has_secure_password

  # class method to authenticate the user
  # User.authenticate(params[:email], params[:password])
  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  def jwt_params
    self.slice(:id, :email, :name, :created_at)
  end
end
