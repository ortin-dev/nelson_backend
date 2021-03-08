class Base
  include Dry::Transaction
  include Core::Helpers::PolicyHelper
  include Core::Helpers::SerializersHelper

  attr_reader :current_user

  protected

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
end
