class Common::AuthController < ActionController::API
  before_action :authenticate_user!
end
