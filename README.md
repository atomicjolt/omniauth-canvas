# OmniAuth Canvas
Gem to authenticate with Instructure Canvas via OAuth2

# Background
OmniAuth Canvas grew out of the need to simplify the process of setting up LTI and connecting a user account on
http://www.OpenTapestry.com to Instructure Canvas.

# Setup
Contact Instructure or your Canvas administrator to get an OAuth key and secret. By default omniauth-canvas will attempt to
authenticate with http://canvas.instructure.com. To dynamically set the canvas site url do the following:

## Standard setup

  # NOTE that you will need to set `env['rack.session']['oauth_site']` to the current Canvas instance that you wish to OAuth with. By default this is https://canvas.instructure.com

  ```ruby
  use OmniAuth::Builder do
    provider :canvas, 'canvas_key', 'canvas_secret', :setup => lambda{|env|
      request = Rack::Request.new(env)
      env['omniauth.strategy'].options[:client_options].site = env['rack.session']['oauth_site']
    }
  end
  ```

## Setup with Devise

  ```ruby
  config.omniauth :canvas, 'canvas_key', 'canvas_secret', :setup => lambda{|env|
    request = Rack::Request.new(env)
    env['omniauth.strategy'].options[:client_options].site = env['rack.session']['oauth_site']
  }
  ```

## Canvas Configuration

If you are running your own installation of canvas, you can generate a client ID
and secret in the Site Admin account of your Canvas install. There will be a
"Developer Keys" tab on the left navigation sidebar. For more information,
consult the [Canvas OAuth Documentation](https://canvas.instructure.com/doc/api/file.oauth.html)


## License

Copyright (C) 2012-2016 by Justin Ball and Atomic Jolt.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
