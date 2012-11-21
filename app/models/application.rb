class Application < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :redirect_uri, :secret, :uid
end
