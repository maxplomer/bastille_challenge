class UrlMethods
  require 'set'

  def initialize  
    @db_hash = Hash.new {|hash, key| hash[key] = Set.new }
  end

  def save_url(user_token, url)
    return false if @db_hash[user_token].include? url
    @db_hash[user_token] << url
    true
  end

  def get_urls(user_token)
    @db_hash[user_token] if @db_hash.key? user_token 
  end

  def remove_url(user_token, url)
    return false unless @db_hash.key? user_token
    return false unless @db_hash[user_token].include? url
    @db_hash[user_token].delete url
    true
  end

end

require 'rspec'
describe UrlMethods do
  it 'returns false if already added' do
    #deck.take(2)
    expect(2).to eq(2)
  end

end

app = UrlMethods.new
p app.save_url('user-12345678', 'http://news.google.com')
p app.save_url('user-12345678', 'http://news.google.com')
p app.save_url('user-12345678', 'http://news.yahoo.com')
p app.get_urls('user-12345678')
p app.get_urls('user-1234567')
p app.remove_url('user-12345678', 'http://news.yahoo.com')
p app.remove_url('user-12345678', 'http://news.yahoo.com')

