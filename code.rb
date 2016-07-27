module UrlMethods
  require 'set'
  hash = Hash.new {|hash, key| hash[key] = Set.new }

  def saveUrl(user_token, url)
    

  end

end





UrlMethods.saveUrl('user-12345678', 'http://news.google.com')