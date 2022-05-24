module Authorizable
  extend ActiveSupport::Concern
  JWT_SECRET_KEY = 'my-secret-key'

  def encode_token(payload)
    JWT.encode(payload, JWT_SECRET_KEY)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, JWT_SECRET_KEY, true)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def set_current_user
    if decoded_token
      user_id = decoded_token[0]
      @user = User.find_by(id: user_id)
    end
  end
end
