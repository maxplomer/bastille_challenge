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
  	if @db_hash.key?(user_token)
      @db_hash[user_token]
    else
      nil
    end
  end

end

app = UrlMethods.new
p app.save_url('user-12345678', 'http://news.google.com')
p app.save_url('user-12345678', 'http://news.google.com')
p app.save_url('user-12345678', 'http://news.yahoo.com')
p app.get_urls('user-12345678')
p app.get_urls('user-1234567')


