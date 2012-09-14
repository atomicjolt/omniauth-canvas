require 'spec_helper'

describe OmniAuth::Strategies::OAuth2 do
  def app; lambda{|env| [200, {}, ["Hello."]]} end

  before do
    @request = double('Request')
    @request.stub(:params) { {} }
    OmniAuth.config.test_mode = true
  end

  subject do
    OmniAuth::Strategies::Canvas.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  after do
    OmniAuth.config.test_mode = false
  end

  context "client options" do
    it "has correct api site" do
      subject.options.client_options.site.should eq("https://canvas.instructure.com")
    end

    it "has correct access token path" do
      subject.options.client_options.token_url.should eq("/login/oauth2/token")
    end

    it "has correct authorize url" do
      subject.options.client_options.authorize_url.should eq("/login/oauth2/auth")
    end
  end

end
