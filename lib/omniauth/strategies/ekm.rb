require "omniauth/strategies/oauth2"

module OmniAuth
  module Strategies
    class Ekm < OmniAuth::Strategies::OAuth2

      option :name, "ekm"

      option :client_options, {
        authorize_url: "https://api.ekm.net/connect/authorize",
        token_url: "https://api.ekm.net/connect/token",
        site: "https://www.ekm.com/"
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

      info do
        {
          name: raw_info["user"]["name"],
          bio: raw_info["user"]["bio"],
          facebook_profile: raw_info["user"]["facebook_profile"],
          twitter_handle: raw_info["user"]["twitter_handle"],
          id: raw_info["user"]["id"]
        }
      end

      uid { raw_info["user"]["id"].to_s }

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        puts access_token
        @raw_info ||= access_token.get("/api/v2/user").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "gumroad", "Gumroad"