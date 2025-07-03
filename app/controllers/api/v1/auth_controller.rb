class Api::V1::AuthController < ApplicationController
  skip_before_action :authenticate_user!, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
      # Ändern Sie diese Zeile von Rails.application.secrets.secret_key_base zu:
      token = JWT.encode(payload, Rails.application.secret_key_base)
      
      render json: { 
        token: token,
        user: {
          id: user.id,
          email: user.email
        }
      }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
