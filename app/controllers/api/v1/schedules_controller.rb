class Api::V1::SchedulesController < ActionController::API
  before_action :authenticate_user!

  def show
    user = get_user_from_token

    render json: {
      message: "If you see this you're in!",
      user: user
    }
  end

  private

  def get_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
                             Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    puts "user_id :>> #{user_id}"
    user = User.find(user_id.to_s)

    puts "user :>> #{user}"
  end
end
