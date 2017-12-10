module UsersHelper
  def following?(user)
    current_user.followed.include?(user) ? true : false
  end
end
