require "log"

require "./default"

module Octokit
  Log = ::Log.for(self)

  # Provides configuration options for `Client`.
  module Configurable
    # :nodoc:
    KEYS = [
      "access_token",
      "api_endpoint",
      "auto_paginate",
      "bearer_token",
      "client_id",
      "client_secret",
      "connection_options",
      "default_media_type",
      "login",
      "management_console_endpoint",
      "management_console_password",
      "middleware",
      "per_page",
      "password",
      "proxy",
      "ssl_verify_mode",
      "user_agent",
      "web_endpoint",
    ]

    # Access token for authentication.
    property access_token : String? = nil

    # Whether or not to auto paginate.
    property auto_paginate : Bool = Default.auto_paginate

    property bearer_token : String? = nil

    property client_id : String? = nil

    property client_secret : String? = nil

    # The default type to use for accept headers.
    property default_media_type : String = Default.default_media_type

    # `Halite::Options` to be used for all connections.
    property connection_options : Halite::Options = Default.connection_options

    # Array of `Halite::Feature` to be used as middleware for requests.
    property middleware : Array(Halite::Feature) = Default.middleware

    # Add middleware to the middleware stack.
    def add_middleware(middleware : Halite::Feature)
      self.middleware << middleware
    end

    # The maximum results returned per page for paginated endpoints.
    property per_page : Int32?

    # The proxy to use when connecting.
    # **Note:** Crystal's `HTTP::Client` and by extension `Halite` do not yet
    # support proxy's.
    # Therefore this option does nothing for now.
    property proxy : String? = nil

    # The `OpenSSL` verify mode to use for SSL connections.
    # 0 is OpenSSL::SSL::NONE
    # 1 is OpenSSL::SSL::PEER
    property ssl_verify_mode : Int32 = Default.ssl_verify_mode

    # The User Agent header to be passed to all requests.
    property user_agent : String = Default.user_agent

    setter web_endpoint : String = Default.web_endpoint

    setter api_endpoint : String = Default.api_endpoint

    setter password : String? = nil

    setter login : String? = nil

    setter management_console_endpoint : String? = nil

    setter management_console_password : String? = nil

    # Yield a block allowing configuration of options.
    #
    # **Example:**
    # ```
    # @client.configure do
    #   auto_paginate = true
    # end
    # ```
    def configure(&block)
      yield
    end

    def reset!
      do_reset!
    end

    # Resets the configuration options to their defaults definied in `Default`.
    private macro do_reset!
      {% begin %}
        {% for key in KEYS %}
          @{{ key.id }} = Octokit::Default.options[{{ key.id.stringify }}]
        {% end %}
      {% end %}
    end

    # API endpoint for `Client`.
    def api_endpoint
      File.join(@api_endpoint, "")
    end

    # API endpoint for `EnterpriseManagementConsoleClient`
    def management_console_endpoint
      return if @management_console_endpoint.nil?
      File.join(@management_console_endpoint.not_nil!, "")
    end

    # Base URL for generated web URLs
    def web_endpoint
      File.join(@web_endpoint, "")
    end

    # The username of the authenticated user
    def login
      @login ||= begin
        user.login if token_authenticated?
      rescue e : Exception
      end
    end

    private macro options
      {% begin %}
        [
        {% for key in KEYS %}
          [{{key.id.stringify}}, @{{key.id}}],
        {% end %}
        ].to_h
      {% end %}
    end
  end
end
