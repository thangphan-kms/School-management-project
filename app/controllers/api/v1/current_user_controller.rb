class Api::V1::CurrentUserController < ActionController::API
  # before_action :authenticate_user!

  def index
    errors = Api::V1::Errors::StandardError.new(
      title: 'Custom Error Title',
      detail: 'This is a custom error message.',
      status: 401,
      source: { pointer: '/request/path' }
    )

    # puts "errors.title :>> #{errors.title}"
    puts "errors.detail :>> #{errors.detail}"
    puts "errors.status :>> #{errors.status}"

    render json: {
      status: { code: 200 },
      # data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      data: current_user
    }, status: :ok
  end
end
