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
  
  # 'this' user is actively subscribed to other users
  # i.e. user.active_subscriptions.create(subscribed_id: another_user.id) means that
  # 'this' user is following another_user
  # i.e. active_subscription.subscriber returns the subscriber
  # i.e. active_subscription.subscribed returns the subscribed user
  has_many :active_subscriptions, class_name: "Subscription", foreign_key: "subscriber_id", dependent: :destroy
  # the other users that 'this' user is subscribing to
  # i.e. user.subscribing.include?(other_user) checks whether 'this' user is subscribing to other_user
  has_many :subscribing, through: :active_subscriptions, source: :subscribed
  
  # reverse of active_subscriptions
  # represents other users who are subscribed to 'this' user
  has_many :passive_subscriptions, class_name: "Subscription", foreign_key: "subscribed_id", dependent: :destroy
  # i.e. user.subscribers.include?(other_user) checks whether other_user is subscribing to 'this' user
  has_many :subscribers, through: :passive_subscriptions, source: :subscriber
  
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
  
  ##### Utility methods for subscriptions #####
  
  # Subscribes to another user
  def subscribe(other_user)
    active_subscriptions.create(subscribed_id: other_user.id)
  end
  
  # Unsubscribes to another user
  def unsubscribe(other_user)
    active_subscriptions.find_by(subscribed_id: other_user.id).destroy
  end
  
  # Returns true if the current user is following the other user
  def subscribing?(other_user)
    self.subscribing.include?(other_user)
  end
  
  # Returns a user's article feed, which includes:
  # (1) articles that the user has posted him/herself
  # (2) articles that have been posted by users that the user is subscribed to
  # TODO: We need to paginate or introduce infinite scroll for this
  def article_feed
    Article.where("user_id IN (?) OR user_id = ?", subscribing_ids, self.id)
  end
  
end
