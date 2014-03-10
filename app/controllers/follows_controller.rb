class FollowsController < ApplicationController

  def new
    f = Follow.new
    f.leader_id = params[:format]
    f.follower_id = session[:user_id]
    f.save
    redirect_to user_url(f.leader_id), notice: "Now following!"
  end

  def destroy
    f = Follow.find_by(leader_id: params[:id], follower_id: session[:user_id])
    if f.nil?
      redirect_to user_url(params[:id]), notice: "Not following!"
    else
      f.destroy
      redirect_to user_url(params[:id]), notice: "Unfollowed!"
    end
  end

  def show
    user_id = params[:id]
    @leaders = User.joins(:followers).where("follower_id = #{user_id}")
    @followers = User.joins(:leaders).where("leader_id = #{user_id}")
  end

end
