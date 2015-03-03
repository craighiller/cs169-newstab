class Subscription < ActiveRecord::Base
  
  belongs_to :subscriber, class_name: "User"
  belongs_to :subscribed, class_name: "User"
  
  validates_presence_of :subscribed_id
  validates_presence_of :subscriber_id
  
end
