class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @user = User.new(user_params)

    if @user.save
      token = generate_token(@user)
      render json: {
        user: user_data(@user),
        token: token
      }, status: :created
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def show
    render json: { user: user_data(current_user) }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def generate_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def user_data(user)
    {
      id: user.id,
      email: user.email,
      created_at: user.created_at
    }
  end
end