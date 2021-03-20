module Core
  module Helpers
    module SerializersHelper
      def serializer_for(serializer_name, record, options = {})
        return unless options[:current_user]

        serializer_name = "#{serializer_name.to_s.split('_').map(&:capitalize).join}Serializer"

        serializer_module = "#{options[:current_user].role.to_s.capitalize}Serializers".constantize
        serializer_module = 'SharedSerializers'.constantize unless serializer_module.constants.include?(serializer_name.to_sym)

        serializer_class_name = "#{serializer_module}::#{serializer_name}".constantize
        serializer_class_name.new(record).serializable_hash
      rescue NameError => e
        "Serializer not defined: #{serializer_module}::#{serializer_name}"
      end
    end
  end
end
