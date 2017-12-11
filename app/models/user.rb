class User < ApplicationRecord
  PASSWORD_LENGTH = (6..25)
  USERNAME_LENGTH = (5..15)

  validates_presence_of :username
  validates :username, length: USERNAME_LENGTH, uniqueness: true

  validates :password, length: PASSWORD_LENGTH, allow_nil: true

  has_many :posts, dependent: :destroy
  # my doing
  has_many :is_following, class_name: "Followship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Followship", foreign_key: "followed_id", dependent: :destroy
  # their doing
  has_many :following, through: :is_following, source: :followed
  has_many :was_followed, through: :followed, source: :follower

  attr_reader :password

  def self.find_from_credentials(username, password)
    user = find_by(username: username)
    return nil unless user
    user if user.is_password?(password)
  end

  def is_password?(password_attempt)
    BCrypt::Password.new(password_digest).is_password?(password_attempt)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
