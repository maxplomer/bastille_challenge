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
