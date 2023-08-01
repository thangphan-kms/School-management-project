class Api::V1::Users::SessionsController < Devise::SessionsController
  def create
    puts '----------------> create method(login) SessionsController <-----------------------'
    user_params = params[:user]

    if user_params.present?
      user = User.find_by(email: user_params[:email])

      if user&.valid_password?(user_params[:password]) && sign_in(:user, user)
        puts "sign_in(:user, user) :>> #{sign_in(:user, user)}"
        login_success(user)
      else
        login_failed
      end
    else
      login_failed
    end
  end

  def login_success(user)
    puts '----------------> login_success SessionsController <-----------------------'

    render json: {
      status: { code: 200, message: 'Login successfully' },
      data: UserSerializer.new(user).serializable_hash[:data][:attributes],
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
    puts '----------------> respond_with method SessionsController <-----------------------'
    puts "resource :>> #{resource}"
    puts "name :>> #{resource.name}"
    puts "resource.errors.full_messages :>> #{resource.errors.full_messages}"

    render json: {
      message: 'You are logged in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    puts '----------------> SessionsControllerrespond_to_on_destroy  <-----------------------'
    token = request.headers['Authorization'].split(' ')[1]
    puts "token :>> #{token}"
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    current_user = User.find(jwt_payload['sub'])
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
