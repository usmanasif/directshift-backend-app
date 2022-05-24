class Users::SessionsController < Devise::SessionsController
  include Authorizable
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    @user = User.find_by(email: user_params[:email])
    response = @user&.valid_password?(user_params[:password]) ? encode_token(@user.id) : nil
    if response
      render json: { accessToken: response }, status: :ok
    else
      render json: { message: 'Incorrect email/password' }, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logged out failure.' }, status: :unauthorized
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
