class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  
  attr_accessible :email, :password, :password_confirmation
end
