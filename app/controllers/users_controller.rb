class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    token = AuthenticationToken.call(user.id)
    render json: { token: token }, status: :created
  end

  def login
    user = User.find_by(email: params[:email])
    raise AuthenticationError unless user.authenticate(params[:password])
    token = AuthenticationToken.call(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
