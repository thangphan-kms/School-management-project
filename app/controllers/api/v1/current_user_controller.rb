class Api::V1::CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def index
    puts 'index of current_user_controller'
    render json: current_user, status: :ok
  end
end
