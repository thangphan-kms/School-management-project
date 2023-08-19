class Api::V1::RoleController < ActionController::API
  before_action :authenticate_user!

  def index
    roles = Role.all
    render json: {
      status: { code: 200 },
      data: roles
    }, status: :ok
  end
end
