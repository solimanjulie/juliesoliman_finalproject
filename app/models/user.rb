class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :likes
  has_many :comments

  has_many :followers, :class_name => 'Follow', :foreign_key => 'leader_id'
  has_many :leaders, :class_name => 'Follow', :foreign_key => 'follower_id'

  # all fields are mandatory, email must be unique, password a certain length
  validates :email, uniqueness: {case_sensitive: false}
  # validates_presence_of :email, :name, :password
  # validates :password, length: {in: 6..20}

  before_save do
    self.email = self.email.downcase
  end

end
