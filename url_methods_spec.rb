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

# require 'rspec'
# describe UrlMethods do
#   it 'returns false if already added' do
#     #deck.take(2)
#     expect(2).to eq(2)
#   end

# end

# app = UrlMethods.new
# p app.save_url('user-12345678', 'http://news.google.com')
# p app.save_url('user-12345678', 'http://news.google.com')
# p app.save_url('user-12345678', 'http://news.yahoo.com')
# p app.get_urls('user-12345678')
# p app.get_urls('user-1234567')
# p app.remove_url('user-12345678', 'http://news.yahoo.com')
# p app.remove_url('user-12345678', 'http://news.yahoo.com')

