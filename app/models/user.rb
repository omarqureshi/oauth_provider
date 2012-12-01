class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :password, :minimum => 6, :if => Proc.new {|u| u.password_digest.blank? || !u.password.blank? }
  
  attr_accessible :email, :password, :password_confirmation
end
