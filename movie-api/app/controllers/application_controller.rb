class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # Catch ActiveRecord::RecordNotFound and respond with 404
  protected def record_not_found
    response = { code: 404, message: 'Record not found.' }
    render json: response, status: :not_found
  end
end
