# Controller for user creation and login
class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    token = AuthenticationToken.encode(user.id)
    render json: { token: token, user: user }, status: :created
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
