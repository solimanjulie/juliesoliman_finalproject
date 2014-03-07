class Follow < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :leader, class_name: "User"

  before_create :check_if_already_following

  def check_if_already_following
    @check = Follow.where(:follower_id => self.follower_id, :leader_id => self.leader_id).count
    if @check.nil? || @check == 0
      return true
    else
      return false
    end
  end
end
