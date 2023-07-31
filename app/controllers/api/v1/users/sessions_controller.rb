class Api::V1::Users::SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    puts '----------------> respond_with method SessionsController <-----------------------'
    puts "resource :>> #{resource}"
    puts "name :>> #{resource.name}"
    render json: {
      message: 'You are logged in',
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    puts '----------------> respond_to_on_destroy SessionsController <-----------------------'
    token = request.headers['Authorization'].split(' ')[1]
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
