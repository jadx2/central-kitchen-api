# frozen_string_literal: true

# Controller for user creation and login
class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    token = AuthenticationToken.encode(user.id)
    render json: { token: token, message: Message.account_created }, status: :created
  end

  def login
    user = User.find_by(email: params[:email])
    raise(AuthenticationError, Message.missing_credentials) unless user.authenticate(params[:password])

    token = AuthenticationToken.encode(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
