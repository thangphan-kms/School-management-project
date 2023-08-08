class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  def respond_with(resource, _opts = {})
    if resource.persisted?
      register_success(resource)
    else
      register_failed(resource)
    end
  end

  def register_success(resource)
    render json: {
      status: { code: 200, message: 'Signed up successfully' },
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def register_failed(resource)
    render json: {
      status: { message: 'User could not be created successfull',
                errors: resource.errors.full_messages }
    }, status: :unprocessable_entity
  end
end
