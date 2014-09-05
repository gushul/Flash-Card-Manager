class User < ActiveRecord::Base
  before_save { email.downcase }

  has_many :cards

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { :minimum => 8 }
  validates_confirmation_of :password

end
