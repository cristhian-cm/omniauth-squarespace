require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Squarespace < OmniAuth::Strategies::OAuth2

      option :name, "squarespace"

      option :client_options, {
        authorize_url: "https://login.squarespace.com/api/1/login/oauth/provider/authorize",
        token_url: "https://login.squarespace.com/api/1/login/oauth/provider/tokens",
        site: "https://www.squarespace.com/"
      }

      def request_phase
        super
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end

      def callback_url
        options[:redirect_uri] || full_host + script_name + callback_path
      end

      def callback_phase 
        puts "************callback_phase************"
        puts request.params
        puts params
        puts "************callback_phase************"
      end
    end
  end
end
