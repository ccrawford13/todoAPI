class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render json: { message: "ERROR - Object Could Not Be Found" }, status: :not_found
  end

  def authenticate_user
    permission_denied_error unless authenticated?
  end

  def authenticated?
    authenticate_or_request_with_http_basic {|user_name, password|
    User.find_by(user_name: user_name).try(:authenticate, password)}
  end

  def permission_denied_error
    error(403, 'Permission Denied!')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "ERROR",
      message: message
    }

    render json: response.to_json, status: status
  end
end
