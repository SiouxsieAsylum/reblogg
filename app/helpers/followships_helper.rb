module FollowshipsHelper
    def self.add(user)
    followed << user
  end

  def self.delete(user)
    followed.delete(user)
  end
end
