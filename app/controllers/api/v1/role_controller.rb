class Api::V1::RoleController < ApplicationController
  before_action :authenticate_user!

  def index
    roles = Role.all
    # users = User.all
    render json: {
      status: { code: 200 },
      data: roles
    }, status: :ok
  end
end
