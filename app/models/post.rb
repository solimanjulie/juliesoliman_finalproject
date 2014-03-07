class Post < ActiveRecord::Base

  belongs_to :user
  has_many :likers
  has_many :commenters
  has_many :topics

  validate :post_text_entered

  def post_text_entered
    if text.blank?
      errors.add(:text, "cannot be empty")
    end
  end

end
