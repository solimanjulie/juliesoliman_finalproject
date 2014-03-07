class LikesController < ApplicationController

   # before_action :check_if_liked, :only => :new

  # just in case!
  # def check_if_liked
  #   @check = Like.find_by(:user_id => session[:user_id], :post_id => params[:format])
  #   if @check
  #     redirect_to_current_url "Already liked!"
  #   end
  # end

  def redirect_to_current_url(notice_string)
      session[:return_to] ||= request.referer
      if notice_string
        redirect_to session.delete(:return_to), notice: notice_string
      else
        redirect_to session.delete(:return_to)
      end
  end

  def new
    post_id = params[:format]
    user_id = session[:user_id]

    l = Like.new
    l.post_id = post_id
    l.user_id = user_id
    l.save
    redirect_to_current_url "Liked!"
  end


  def destroy
    post_id = params[:id]
    user_id = session[:user_id]
    l = Like.find_by(post_id: params[:id], user_id: session[:user_id])
    if l.nil?
      redirect_to_current_url "Not liked"
    else
      l.destroy
      redirect_to_current_url "Unliked!"
    end
  end

end
