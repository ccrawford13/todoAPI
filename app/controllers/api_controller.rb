class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  respond_to :json

  private

  def authenticate_user
    permission_denied_error unless authenticated?
  end

  def valid_user(user_name,password)
    user = User.where(user_name: user_name).first
    if user
      user.valid_password?(password)
    else
      permission_denied_error
    end
  end

  def authenticated?
    authenticate_or_request_with_http_basic {|user_name, password| valid_user(user_name, password).present? }
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
