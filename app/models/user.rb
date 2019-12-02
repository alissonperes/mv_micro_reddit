class User < ApplicationRecord
  has_many :posts
  validates :name, presence: true, length: { maximum: 60 }
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :username, presence: true, length: { minimum: 4, maximum: 60 },
                       uniqueness: { case_sensitive: false }
end
