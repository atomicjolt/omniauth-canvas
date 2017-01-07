require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Canvas < OmniAuth::Strategies::OAuth2
      option :name, "canvas"

      option :client_options,
             site:          "https://canvas.instructure.com",
             authorize_url: "/login/oauth2/auth",
             token_url:     "/login/oauth2/token"

      option :provider_ignores_state, false

      option :token_params,
             parse: :json

      uid do
        access_token["user"]["id"]
      end

      info do
        {
          "name" => raw_info["name"],
          "email" => raw_info["primary_email"],
          "bio" => raw_info["bio"],
          "title" => raw_info["title"],
          "nickname" => raw_info["login_id"],
          "active_avatar" => raw_info["avatar_url"],
          "url" => access_token.client.site
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/users/#{access_token['user']['id']}/profile").parsed
      end

      # Passing any query string value to Canvas will result in:
      # redirect_uri does not match client settings
      # so we set the value to empty string
      def query_string
        ""
      end

      # Override authorize_params so that we can be deliberate about setting state if needed
      def authorize_params
        # Only set state if it hasn't already been set
        options.authorize_params[:state] ||= SecureRandom.hex(24)
        params = options.authorize_params.merge(options_for("authorize"))
        if OmniAuth.config.test_mode
          @env ||= {}
          @env["rack.session"] ||= {}
        end
        session["omniauth.state"] = params[:state]
        params
      end
    end
  end
end

OmniAuth.config.add_camelization "canvas", "Canvas"
