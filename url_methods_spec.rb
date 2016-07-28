require 'rspec'
require './url_methods'

describe UrlMethods do
  describe "#save_url" do
    before do
      @app = UrlMethods.new
    end

    it "returns true if added" do
      @app.save_url('user-12345678', 'http://news.google.com').should be_true
    end

    it "returns false if already added" do
      @app.save_url('user-12345678', 'http://news.google.com')
      @app.save_url('user-12345678', 'http://news.google.com').should be_false
    end
  end

  describe "#get_urls" do
    before do
      @app = UrlMethods.new
    end

    it "retrieves saved urls" do
      @app.save_url('user-12345678', 'http://news.google.com')
      @app.save_url('user-12345678', 'http://news.yahoo.com')
      expect(@app.get_urls('user-12345678')).to eq(Set.new ["http://news.google.com", "http://news.yahoo.com"])
    end

    it "returns nil if no urls saved" do
      result = @app.get_urls('user-12345678')
      expect(result).to eq(nil)
    end
  end

  describe "#remove_url" do
    before do
      @app = UrlMethods.new
    end

    it "returns true if removed url" do
      @app.save_url('user-12345678', 'http://news.google.com')
      @app.remove_url('user-12345678', 'http://news.google.com').should be_true
    end

    it "returns false is url doesn't exist" do
      @app.remove_url('user-12345678', 'http://news.google.com').should be_false
    end
  end
end
