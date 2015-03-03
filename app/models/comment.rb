class Comment < ActiveRecord::Base
  
  validates_presence_of :body
  validates_presence_of :user_id
  validates_presence_of :article_id
    
  belongs_to :article
  belongs_to :user
  
  def posted_by? user
    user && self.user_id == user.id
  end
  
end
