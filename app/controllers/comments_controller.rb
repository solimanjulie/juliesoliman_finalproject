class CommentsController < ApplicationController

  def redirect_to_current_url(notice_string)
      session[:return_to] ||= request.referer
      if notice_string
        redirect_to session.delete(:return_to), notice: notice_string
      else
        redirect_to session.delete(:return_to)
      end
  end

  def create
    c = Comment.new
    c.post_id = params[:format]
    c.user_id = session[:user_id]
    c.text = params[:comment_text]
    if c.valid?
      c.save
      redirect_to_current_url "Commented!"
    else
      redirect_to_current_url "Invalid comment - Make sure you entered text!"
    end
  end

end
