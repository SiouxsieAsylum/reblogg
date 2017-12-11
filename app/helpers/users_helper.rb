module UsersHelper
  def following?(user="Jim")
    return false if !user
    current_user.followed.include?(user) ? true : false
  end

  def add(user)
    @followship = Followship.new(followed_id: user.id)
    if @followship.save
      flash[:notice] = "Followed!!"
      redirect_to users_path
    else
      flash[:error] = user.errors.full_messages.join(', ')
      # p user.errors
      redirect_to users_path
    end
  end

  def delete(user)
    @followship = Followship.find_by(follower_id: current_user.id, followed_id: user.id)
    @followship.destroy!
    redirect_to users_path
  end

end
