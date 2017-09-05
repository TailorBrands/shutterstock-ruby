require 'spec_helper'

RSpec.describe "ShutterstockRuby instance client" do

  it 'has the correct default' do
    client = ShutterstockRuby::Client.new

    expect(client.configuration.access_token).to be nil
    expect(client.configuration.api_client).to be nil
    expect(client.configuration.api_secret).to be nil
  end

  it 'sets the correct configuration' do
    token = SecureRandom.uuid
    key = SecureRandom.uuid
    secret = SecureRandom.uuid

    client = ShutterstockRuby::Client.new(access_token: token, api_client: key, api_secret: secret)

    expect(client.configuration.access_token).to equal(token)
    expect(client.configuration.api_client).to equal(key)
    expect(client.configuration.api_secret).to equal(secret)
  end
end


RSpec.describe "ShutterstockRuby static client" do
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
