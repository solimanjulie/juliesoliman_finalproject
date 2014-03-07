class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User"
  belongs_to :post

  validates :text, presence: true

end
