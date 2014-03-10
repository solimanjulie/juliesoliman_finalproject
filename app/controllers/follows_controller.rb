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
    # TODO: FIX THIS LOGIC
    @leaders = User.joins('INNER JOIN follows ON users.id = follows.leader_id').where(follower_id = params[:id]).where.not(id: params[:id]).distinct
    @followers = User.joins('INNER JOIN follows ON users.id = follows.follower_id').where(leader_id = params[:id]).where.not(id: params[:id]).distinct
  end

end
