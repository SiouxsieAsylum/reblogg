class FollowshipsController < ApplicationController
    def create
    user = User.find(params[:followed_id])
    current_user.add(user)
    redirect_to user
  end

  def destroy
    user = Followship.find(params[:id]).followed
    current_user.delete(user)
    redirect_to user
  end
end
end
