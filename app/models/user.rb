class User < ApplicationRecord
  has_many :posts
  has_many :comments
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 70 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: { minimum: 4, maximum: 60 },
                       uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
