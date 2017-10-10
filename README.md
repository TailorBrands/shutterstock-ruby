The Shutterstock Ruby API Wrapper
===================

A Ruby API wrapper for [Shutterstock](http://www.shutterstock.com/) [API's](http://developers.shutterstock.com)

[![Gem Version](https://badge.fury.io/rb/shutterstock-ruby.svg)](http://badge.fury.io/rb/shutterstock-ruby)[![Dependency Status](https://gemnasium.com/TailorBrands/shutterstock-ruby.svg)](https://gemnasium.com/TailorBrands/shutterstock-ruby)
[![Circle CI](https://circleci.com/gh/TailorBrands/shutterstock-ruby/tree/master.svg?style=svg)](https://circleci.com/gh/TailorBrands/shutterstock-ruby/tree/master)  [![Code Climate](https://codeclimate.com/github/TailorBrands/shutterstock-ruby/badges/gpa.svg)](https://codeclimate.com/github/TailorBrands/shutterstock-ruby) 

```rb
gem "shutterstock-ruby"
```

## Missing

Current version only wraps the Image and Video search, purchase and download API's. Feel free to send a pull request with more API's wrapped!

## Usage

You need a valid client_id/secret combo to use the Gem, you can get it by signing up [here](http://developers.shutterstock.com)

*Raises Exception on missing credentials*

### Configuration
You can use an initializer for example if you're on Rails.
```rb
# initializers/shutterstock.rb
ShutterstockRuby.configure do |config|
  config.api_client = ENV['SHUTTERSTOCK_CLIENT']
  config.api_secret = ENV['SHUTTERSTOCK_SECRET']
end
```

If you require multiple clients, you can create an instance:
```rb
@client ||= ShutterstockRuby::Client.new(access_token: access_token)
```

You must supply either an `api_client` and an `api_secret`, or an `access_token`.

### Search for images

```rb
result = ShutterstockRuby::Images.search('Cat') # Returns a hash of the parsed JSON result.
```
Source [source](https://developers.shutterstock.com/api/v2/images/search)

### Search for videos

Using the singleton client:
```rb
result = ShutterstockRuby::Videos.search('Cat') # Returns a hash of the parsed JSON result.
```

Using an instance of the client:
```rb
result = @client.videos.search('Cat') # Returns a hash of the parsed JSON result.
```

Source [source](https://developers.shutterstock.com/api/v2/videos/search)

### Details for a video

```rb
result = @client.videos.details(video_id) # Returns a hash of the parsed JSON result.
```
Source [source](https://developers.shutterstock.com/api/v2/videos/get)

### Purchase a video

```rb
result = @client.videos.purchase(video_id, subscription_id, size) # Returns a hash of the parsed JSON result.
```
Source [source](https://developers.shutterstock.com/api/v2/videos/license)

### Retrieve an existing license for a video

```rb
result = @client.videos.licenses(video_id, license_name) # Returns a hash of the parsed JSON result.
```
Source [source](https://developers.shutterstock.com/api/v2/videos/licenses)

### Download a video that has already been purchased

```rb
result = @client.videos.download(license_id) # Returns a hash of the parsed JSON result.
```
Source [source](https://developers.shutterstock.com/api/v2/videos/download)


## Disclaimer

This is completely unofficial and is not related to Shutterstock in any way.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## About Tailor Brands
[Check us out!](https://www.tailorbrands.com)
