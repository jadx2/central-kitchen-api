class AuthenticationController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    raise(AuthenticationError, Message.invalid_credentials) unless user&.authenticate(params[:password])

    token = AuthenticationToken.encode(user.id)

    render json: { token: token, user: user }, status: :created
  end
end
