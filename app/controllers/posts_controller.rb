class PostsController < ApplicationController

  before_action :require_login, :except => [:home, :login]
  before_action :identify_user

  def identify_user
    user = User.find_by(id: session[:user_id])
    if user
      @username = user.name
    end
  end

  def require_login
    if session[:user_id].blank?
      redirect_to root_url, notice: "Nice Try!"
    end
  end

  def logout
    reset_session
    redirect_to root_url
  end

  def login
    session[:user_id] = params[:name]
    redirect_to root_url
  end

  def index
    @posts = Post.all.order("updated_at desc")
  end

  def destroy
    post_id = params["id"]
    p = Post.find_by(:id => post_id)
    u_id = p.user_id
    p.destroy
    redirect_to user_url(u_id)
  end

  def edit
    post_id = params["id"]
    @post = Post.find_by(:id => post_id)
  end

   def update
    post_id = params["id"]
    p = Post.find_by(:id => post_id)
    p.text = params["post_text"]
    p.save
    u_id = p.user_id
    redirect_to user_url(u_id), notice: "Post updated successfully!"
  end

  def create
      p = Post.new
      p.text = params["post_text"]
      p.user_id = session[:user_id]
      p.save

      if p.errors.any?
        p.errors.full_messages.each do |msg|
          redirect_to user_url(session[:user_id]), :notice => msg
        end
      else
        topic_ids = params["topic_id"]
        if topic_ids
            topic_ids.each do |topic_id|
              if !topic_id.blank?
                Mention.create(:topic_id => topic_id, :post_id => p.id)
              end
          end
        end
        redirect_to user_url(session[:user_id]), notice: "Posted!"
      end
  end

  def home
    if session[:user_id].blank?
      @logged_in = false
    else
      @logged_in = true
      follower_id = session[:user_id]
      leader_ids = User.joins(:followers).where("follower_id = #{follower_id}").uniq
      @posts = Post.where(user_id: leader_ids).order("updated_at desc")
    end
    @num_users = User.count
    @num_posts = Post.count
    @latest_post_time = Post.order("updated_at asc").first.updated_at
  end
end
