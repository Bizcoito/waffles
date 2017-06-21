module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::ParameterMissing do |e|
      json_response({ message: e.message }, :bad_request)
    end
  end
end
