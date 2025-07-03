class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.secret_key_base)
      debugger
      @current_user = User.find(decoded[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
