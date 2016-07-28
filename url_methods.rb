class String
  def get_domain
    URI(self).host.match(/[^\.]+\.\w+$/).to_s
  end
end

class Node
  attr_accessor :a, :b, :c
  def initialize(data)
    @data = data
  end

  def get_url
    @data
  end
end

class UrlMethods
  require 'set'
  require 'uri'

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

  def get_users_by_domain(domain)
    users = Set.new

    @db_hash.each do |user_token, url_set|
      users << user_token if url_set.map(&:get_domain).include? domain
    end

    users
  end

  def get_node(url)
    #assume already written so return dummy data
    root = Node.new('http://news.google.com')
    root.a = Node.new('http://news.yahoo.com')
    root.b = Node.new('http://www.cnn.com')
    root.c = Node.new('http://www.cnn.com')

    root
  end
end

#source for get_domain method: http://stackoverflow.com/questions/6674230/how-would-you-parse-a-url-in-ruby-to-get-the-main-domain
