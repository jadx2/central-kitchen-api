# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def create
    p params.require(:email)
    p params.require(:password)

    render json: { token: '123' }, status: :created
  end
end
