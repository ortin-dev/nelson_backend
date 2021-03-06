module Core
  module Helpers
    module CommandsHelper
      def operation_for(operation_name, class_name)
        operation_class_name = operation_name.to_s.split('_').map(&:capitalize).join
        module_name = Object.const_get operation_class_name

        operation = "#{module_name}::#{class_name.to_s.capitalize}".classify.constantize
        operation.new
      end
    end
  end
end
