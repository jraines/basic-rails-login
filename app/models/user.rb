class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_many :followings_to, class_name: "Following", foreign_key: "follower_id"
  has_many :followings_from, class_name: "Following", foreign_key: "followed_id"

  has_many :followed_users, through: :followings_from, source: :followed
  has_many :followers, through: :followings_from, source: :follower


  def follow(user)
    user.followers << self
  end


  def unfollow(user)
    user.followers.destroy(self)
  end


  def kick(user)
    followers.destroy(user)
  end

end
