module UsersHelper
  def following?(user="Jim")
    return false if !user
    current_user.followed.include?(user) ? true : false
  end
end
