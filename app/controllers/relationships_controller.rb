class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  #フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referrer
  end

  #フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referrer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
    render "users/followings"
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    render "users/followers"
  end

end
