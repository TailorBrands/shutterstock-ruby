require 'spec_helper'

RSpec.describe ShutterstockRuby do
  after :each do
    ShutterstockRuby.configuration.access_token = nil
    ShutterstockRuby.configuration.api_client = nil
    ShutterstockRuby.configuration.api_secret = nil
  end

  it 'has the correct default' do
    expect(ShutterstockRuby.configuration.access_token).to be nil
    expect(ShutterstockRuby.configuration.api_client).to be nil
    expect(ShutterstockRuby.configuration.api_secret).to be nil
  end

  it 'sets the correct configuration' do
    expect(ShutterstockRuby.configuration.access_token).to be nil
    expect(ShutterstockRuby.configuration.api_client).to be nil
    expect(ShutterstockRuby.configuration.api_secret).to be nil

    token = SecureRandom.uuid
    key = SecureRandom.uuid
    secret = SecureRandom.uuid
    ShutterstockRuby.configure do |config|
      config.access_token = token
      config.api_client = key
      config.api_secret = secret
    end

    expect(ShutterstockRuby.configuration.access_token).to equal(token)
    expect(ShutterstockRuby.configuration.api_client).to equal(key)
    expect(ShutterstockRuby.configuration.api_secret).to equal(secret)
  end
end
