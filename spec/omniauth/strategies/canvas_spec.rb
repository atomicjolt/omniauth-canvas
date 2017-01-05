require "spec_helper"

describe OmniAuth::Strategies::OAuth2 do
  def app; lambda { |_env| [200, {}, ["Hello."]] } end

  before do
    @request = double("Request")
    allow(@request).to receive(:params).and_return({})
    OmniAuth.config.test_mode = true
  end

  subject do
    OmniAuth::Strategies::Canvas.new(nil, @options || {}).tap do |strategy|
      allow(strategy).to receive(:request).and_return(@request)
    end
  end

  after do
    OmniAuth.config.test_mode = false
  end

  context "client options" do
    it "has correct api site" do
      expect(subject.options.client_options.site).to eq("https://canvas.instructure.com")
    end

    it "has correct access token path" do
      expect(subject.options.client_options.token_url).to eq("/login/oauth2/token")
    end

    it "has correct authorize url" do
      expect(subject.options.client_options.authorize_url).to eq("/login/oauth2/auth")
    end
  end
end
