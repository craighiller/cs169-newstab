class Comment < ActiveRecord::Base
  
  validates_presence_of :body
    
  belongs_to :article
  belongs_to :user
  
  def posted_by? user
    user && self.user_id == user.id
  end
  
end
