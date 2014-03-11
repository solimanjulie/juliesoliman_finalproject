class Topic < ActiveRecord::Base
  has_many :mentions
  has_many :posts, through: :mentions
end
