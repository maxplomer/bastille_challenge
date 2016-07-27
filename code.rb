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

  attr_accessor :db_hash

  def initialize  
    @db_hash = Hash.new {|hash, key| hash[key] = Set.new }
  end

end

app = UrlMethods.new