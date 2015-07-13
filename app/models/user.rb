class User < ActiveRecord::Base

  validates_presence_of :username, :password

  validates :username, { uniqueness: true, message: "Pick another username" }

  validates :password, { confirmation: true }

  has_many :posts
  has_many :comments

  has_many :followings_to, class_name: "Following", foreign_key: "follower_id"
  has_many :followings_from, class_name: "Following", foreign_key: "followed_id"

  has_many :followed_users, through: :followings_to, source: :followed
  has_many :followers, through: :followings_from


  has_many :blocked_to, class_name: "Blocking", foreign_key: "blocker_id"
  has_many :blocked_from, class_name: "Blocking", foreign_key: "blocked_id"

  has_many :blocked_users, through: :blocked_to, source: :blocked
  has_many :blocking_users, through: :blocked_from, source: :blocker


  def follow(user)
    raise "Blocked!" if user.blocked_users.find(self)
    user.followers << self
  end


  def unfollow(user)
    user.followers.destroy(self)
  end


  def block(user)
    followers.destroy(user)
    blocked_users << user
  end


  def unblock(user)
    blocked_users.destroy(user)
  end

end
