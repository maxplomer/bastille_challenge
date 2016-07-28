require 'rspec'
require './url_methods'

describe "#save_url" do
  it "returns true if added" do
    app = UrlMethods.new
    result = app.save_url('user-12345678', 'http://news.google.com')
    expect(result).to eq(true)
  end

  it "returns false if already added" do
    app = UrlMethods.new
    app.save_url('user-12345678', 'http://news.google.com')
    result = app.save_url('user-12345678', 'http://news.google.com')
    expect(result).to eq(false)
  end
end

describe "#get_urls" do
  it "retrieves saved urls" do
    app = UrlMethods.new
    app.save_url('user-12345678', 'http://news.google.com')
    app.save_url('user-12345678', 'http://news.yahoo.com')
    result = app.get_urls('user-12345678')
    expect(result).to eq(Set.new ["http://news.google.com", "http://news.yahoo.com"])
  end

  it "returns nil if no urls saved" do
    app = UrlMethods.new
    result = app.get_urls('user-12345678')
    expect(result).to eq(nil)
  end
end

describe "#remove_url" do
  it "returns true if removed url" do
    app = UrlMethods.new
    app.save_url('user-12345678', 'http://news.google.com')
    result = app.remove_url('user-12345678', 'http://news.google.com')
    expect(result).to eq(true)
  end

  it "returns false is url doesn't exist" do
    app = UrlMethods.new
    result = app.remove_url('user-12345678', 'http://news.google.com')
    expect(result).to eq(false)
  end
end
