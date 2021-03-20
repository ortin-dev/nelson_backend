class Base
  include Dry::Transaction
  include Pundit
  include Core::Helpers::PolicyHelper
  include Core::Helpers::SerializersHelper

  attr_reader :current_user

  protected

  def prepare_params(params)
    @current_user = params[:current_user]

    next_step(params)
  end

  def response_success(data, options = {})
    return Success(data) unless options[:serializer]
    Success(serializer_for(options[:serializer], data, current_user: current_user))
  end

  def response_error(error, options = {})
    Failure(error)
  end

  def next_step(input)
    Success(input)
  end

  def authorize_for(resource, action)
    policy_for(resource, current_user).send("#{action}?")
  end
end
