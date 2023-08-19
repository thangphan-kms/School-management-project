class Api::V1::Users::SessionsController < Devise::SessionsController

  def create
    user_params = params[:user]
    if user_params.present?
      user = User.find_by(email: user_params[:email])

      if user&.valid_password?(user_params[:password]) && sign_in(:user, user)
        login_success(user)
      else
        login_failed
      end
    else
      login_failed
    end
  end

  def login_success(user)
    render json: {
      status: { code: 200, message: 'Login successfully' },
      data: UserSerializer.new(user).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def login_failed
    render json: {
      status: {
        code: 401,
        message: 'Invalid email or password!'
      }
    }, status: :unauthorized
  end

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: 'You are logged in',
      user: current_user
    }, status: :ok
  end

  def authorization_header?
    request.headers['Authorization'].blank? ? false : true
  end

  def respond_to_on_destroy
    puts 'respond_to_on_destroy'
     puts "authorization_header? :>> #{authorization_header?}"
    if authorization_header?
      jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                               Rails.application.credentials.devise[:jwt_secret_key]).first
      puts "jwt_payload['sub'] :>> #{jwt_payload['sub']}"
      # Expect to have the active record error throw
      current_user = User.find(jwt_payload['sub'])
    else

    end
    if current_user
      log_out_success
    else
      log_out_failure
    end
  end

  def log_out_success
    render json: {
      status: 200,
      message: 'You are logged out.'
    }, status: :ok
  end

  def log_out_failure
    render json: {
      status: 401,
      message: 'User has no active session.'
    }, status: :unauthorized
  end
end
