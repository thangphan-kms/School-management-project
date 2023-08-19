class Common::BaseController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalidation_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response

  protected

  def render_record_not_found_response
    render json: Errors::ActiveRecordNotFound.new(error.record).to_hash, status: :not_found
  end

  protected

  def render_invalidation_response error
    render json: Errors::ActiveRecordValidation.new(error.record).to_hash, status: :unprocessable_entity
  end
end
