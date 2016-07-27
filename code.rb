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

end

app = UrlMethods.new
p app.save_url('user-12345678', 'http://news.google.com')
p app.save_url('user-12345678', 'http://news.google.com')




