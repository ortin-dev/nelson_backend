module Core
  module Helpers
    module SerializersHelper
      def serializer_for(serializer_name, record, options = {})
        return unless options[:current_user]

        serializer = serializer_name.to_s.split('_').map(&:capitalize).join
        module_name = "#{options[:current_user].role.to_s.capitalize}Serializers"
        serializer_class_name = "#{module_name}::#{serializer}Serializer".constantize
        serializer_class_name.new(record).serializable_hash
      rescue NameError => e
        "Serializer not defined for #{module_name}"
      end
    end
  end
end
