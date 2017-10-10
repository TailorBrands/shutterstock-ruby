require 'spec_helper'

RSpec.describe "ShutterstockRuby Videos API" do

  before do
    @client = ShutterstockRuby::Client.new.videos
  end

  it 'can search for videos' do
    allow(@client).to receive(:get).with("/videos/search", { query: "cats" }).and_return(search_json)
    expect(@client.search("cats")).to eq(JSON.parse(search_json))
  end

  it 'can search for videos with options' do
    allow(@client).to receive(:get).with("/videos/search", { query: "cats", per_page: 10 }).and_return(search_json)
    expect(@client.search("cats", { per_page: 10 })).to eq(JSON.parse(search_json))
  end

  it 'can get the details for a video' do
    allow(@client).to receive(:get).with("/videos", { id: "1234" }).and_return(video_json)
    expect(@client.details("1234")).to eq(JSON.parse(video_json))
  end

  it 'can purchase a video' do
    allow(@client).to receive(:post).with(
      "/videos/licenses",
      { videos: [ { video_id: "1234" } ]}.to_json,
      { subscription_id: "s5678", size: "hd"},
      {}
    ).and_return(purchase_json)

    expect(@client.purchase("1234", "s5678", "hd")).to eq(JSON.parse(purchase_json))
  end

  it 'can purchase a video with metadata and options' do
    allow(@client).to receive(:post).with(
        "/videos/licenses",
        { videos: [ { video_id: "1234", price: 20 } ] }.to_json,
        { subscription_id: "s5678", size: "hd"},
        { my_header: "header" }
    ).and_return(purchase_json)

    expect(@client.purchase("1234", "s5678", "hd", { metadata: { price: 20 }, my_header: "header" })).to eq(JSON.parse(purchase_json))
  end

  it 'can get an existing license for a video' do
    allow(@client).to receive(:get).with("/videos/licenses", { video_id: "1234", license: "comp" }).and_return(license_json)
    expect(@client.licenses("1234", "comp")).to eq(JSON.parse(license_json))
  end

  it 'can get an download link for an existing license' do
    allow(@client).to receive(:post).with("/videos/licenses/v5678/downloads", {}.to_json).and_return(download_json)
    expect(@client.download("v5678")).to eq(JSON.parse(download_json))
  end

  private
  def search_json
    %Q({
        "page": 1,
        "per_page": 1,
        "total_count": 1,
        "search_id": "abcd",
        "data": [
            #{video_json}
        ]
    })
  end

  def purchase_json
    %q({
        "data": [
          {
            "video_id": "1234",
            "download": {
              "url": "http://localhost/1234.mov"
            },
            "allotment_charge": 1
          }
        ]
      })
  end

  def download_json
    %q({
        "url": "http://localhost/1234.mov"
      })
  end

  def video_json
    %q({
        "media_type": "video",
        "id": "1234",
        "description": "",
        "aspect": 1.778,
        "duration": 26,
        "contributor": {
          "id": "1234"
        },
        "aspect_ratio": "16:9",
        "assets": {
          "thumb_webm": {
            "url": "http://localhost/1234/cats.webm"
          },
          "thumb_mp4": {
            "url": "http://localhost/1234/cats.mp4"
          },
          "preview_webm": {
            "url": "http://localhost/1234/cats.webm"
          },
          "preview_mp4": {
            "url": "http://localhost/1234/cats.mp4"
          },
          "thumb_jpg": {
            "url": "http://localhost/1234/cats7.jpg"
          },
          "preview_jpg": {
            "url": "http://localhost/1234/cats7.jpg"
          }
        }
      })
  end

  def license_json
    %q({
        "data": [
          {
            "id": "v5678",
            "user": {
              "username": "user"
            },
            "license": "comp",
            "subscription_id": "s1234",
            "download_time": "2017-10-09T20:31:04-04:00",
            "metadata": {
              "client": "",
              "other": "",
              "job": "",
              "purchase_order": ""
            },
            "is_downloadable": true,
            "video": {
              "id": "1234",
              "format": {
                "size": "hd"
              }
            }
          }
        ],
        "page": 1,
        "per_page": 1
      })
  end
end
