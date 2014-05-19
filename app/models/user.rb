class User < ActiveRecord::Base
  validates_presence_of :email
  validates_presence_of :password_digest

  has_many :teams
  
  self.has_secure_password()
end
