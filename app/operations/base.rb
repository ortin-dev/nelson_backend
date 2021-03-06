class Base
  include Dry::Transaction

  attr_accessor :params

  protected

  def response_success(data)
    Success(data)
  end

  def response_error(error)
    Failure(error)
  end

  def next_step(input)
    Success(input)
  end
end
