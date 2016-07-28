class String
  def get_domain
    URI(self).host.match(/[^\.]+\.\w+$/).to_s
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
   
    p 'http://www.google.com'.get_domain


    users
  end
end

app = UrlMethods.new
app.get_users_by_domain('google.com')


#source for get_domain: http://stackoverflow.com/questions/6674230/how-would-you-parse-a-url-in-ruby-to-get-the-main-domain