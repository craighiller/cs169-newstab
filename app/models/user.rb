class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  has_many :articles
  has_many :likes
  has_many :comments, dependent: :destroy
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
    end
  end
  
  # Checks whether the 'self' user has liked the given article
  def likes? article
    !!(article_like article)
  end
  
  # Gets the like for the given article that the 'self' user has created
  def article_like article
    self.likes.find_by_article_id(article.id)
  end
  
end
