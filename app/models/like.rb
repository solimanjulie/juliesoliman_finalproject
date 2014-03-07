class Like < ActiveRecord::Base
  belongs_to :liker, class_name: "User"
  belongs_to :post

  before_create :check_if_already_liked

  def check_if_already_liked
    @check = Like.where(:post_id => self.post_id, :user_id => self.user_id).count
    if @check.nil? || @check == 0
      return true
    else
      return false
    end
  end

end
