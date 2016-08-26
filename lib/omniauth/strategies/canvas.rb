require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Canvas < OmniAuth::Strategies::OAuth2

      option :name, "canvas"

      option :client_options, {
        :site           => "https://canvas.instructure.com",
        :authorize_url  => "/login/oauth2/auth",
        :token_url      => "/login/oauth2/token"
      }

      option :provider_ignores_state, true

      option :token_params, {
        :parse          => :json
      }

      uid do
        access_token['user']['id']
      end

      info do
        {
          'name' => raw_info['name'],
          'email' => raw_info['primary_email'],
          'bio' => raw_info['bio'],
          'title' => raw_info['title'],
          'nickname' => raw_info['login_id'],
          'active_avatar' => raw_info['avatar_url'],
          'url' => access_token.client.site
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/users/#{access_token['user']['id']}/profile").parsed
      end

      def query_string
        ''
      end
    end
  end
end
OmniAuth.config.add_camelization 'canvas', 'Canvas'
