module Authentication
  extend ActiveSupport::Concern
  include Core::Helpers::JwtHelper

  attr_accessor :current_user

  def not_found
    render json: { error: 'not_found' }, status: 404
  end

  def authenticate_user
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    decoded = decode(token)
    @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
  end
end
