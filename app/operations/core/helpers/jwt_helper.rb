module Core
  module Helpers
    module JwtHelper
      def encode(payload, exp = 240.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base.to_s)
      end

      def decode(token)
        decoded = JWT.decode(token, Rails.application.secrets.secret_key_base.to_s)[0]
        HashWithIndifferentAccess.new decoded
      end
    end
  end
end
