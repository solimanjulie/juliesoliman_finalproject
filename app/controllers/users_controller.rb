class UsersController < ApplicationController

  def redirect_to_current_url(notice_string)
      session[:return_to] ||= request.referer
      if notice_string
        redirect_to session.delete(:return_to), notice: notice_string
      else
        redirect_to session.delete(:return_to)
      end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order("updated_at desc")
    if session[:user_id] != @user.id
      @can_edit = false
    else
      @can_edit = true
    end

    f = Follow.find_by(leader_id: params[:id], follower_id: session[:user_id])
    if f.nil?
      @can_follow = true
    else
      @can_follow = false
    end
  end

  def create
    @user = User.new

    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to root_url, notice: "Thanks for signing up, #{@user.name}!"}
      else
        format.html { redirect_to_current_url "Error creating this user"}
      end
    end
  end
end
