class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 6
  
  attr_accessible :email, :password, :password_confirmation
end
