module Provides
  extend ActiveSupport::Concern

  def provides(provide_name, options = {})
    define_method(provide_name.to_sym) do
      operation_for(options[:via], provide_name.to_sym).call(params) do |operation|
        operation.success do |response|
          render json: { success: true, data: response }, status: :ok
        end

        operation.failure do |response|
          render json: { success: false, errors: response }, status: :unprocessable_entity
        end
      end
    end
  end
end
