class Group < ActiveRecord::Base
  
  belongs_to :creator, class_name: "User", foreign_key: "user_id", dependent: :destroy
  
  has_many :group_subscriptions
  
  has_many :users, through: :group_subscriptions
  
  def followers
    users.count
  end
  
end
