class TopicsController < ApplicationController

  def show
    @topic = Topic.find_by(id: params[:id])
    @posts = Post.joins('INNER JOIN mentions ON posts.id = mentions.post_id').where('mentions.topic_id = ?', @topic.id)
  end

end
