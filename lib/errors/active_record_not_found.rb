module Errors
  class ActiveRecordNotFound < Errors::ApplicationError
    attr_reader :model, :field, :detail, :message_key

    def initialize(error, message: nil)
      @model = error.model.underscore
      @detail = error.class.to_s.underscore
      @field = error.primary_key
      @message_key = message || :default
      @errors = serialize
    end

    def serialize
      [
        {
          resource: resource,
          field: field,
          code: code,
          message: message
        }
      ]
    end
  end
end
