# module UrlMethods
#   require 'set'
#   hash = Hash.new {|hash, key| hash[key] = Set.new }

#   def self.saveUrl(user_token, url)
#   	p hash
#     return false if hash[user_token].include? url

#     hash[user_token] << url

#     true
#   end

# end

# p UrlMethods.saveUrl('user-12345678', 'http://news.google.com')
# p UrlMethods.saveUrl('user-12345678', 'http://news.google.com')


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




