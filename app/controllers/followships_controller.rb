class FollowshipsController < ApplicationController
  include UsersHelper

  def create
    user = User.find(params[:followed_id])
    followship_params
    add(user)
  end

  def destroy
    user = Followship.find(params[:id]).followed
    followship_params
    delete(user)
  end

  private

  def followship_params
    params.require(:post).permit(follower: current_user.id, :followed)
  end

end
