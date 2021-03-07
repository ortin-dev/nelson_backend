module Core
  module Helpers
    module PolicyHelper
      def policy_for(policy_name, *args)
        policy = policy_name.to_s.split('_').map(&:capitalize).join
        policy_class_name = "#{policy}Policy".constantize
        policy_class_name.new(*args)
      end
    end
  end
end
