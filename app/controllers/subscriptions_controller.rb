class SubscriptionsController < ApplicationController
  
  before_action :authenticate_user!
  
  def create
    # parameter subscribed_id received from hidden_field_tag in _subscribe_form
    user = User.find(params[:subscribed_id])
    # helper method defined in user model
    current_user.subscribe(user)
    redirect_to user
  end

  def destroy
    user = Subscription.find(params[:id]).subscribed
    # helper method defined in user model
    current_user.unsubscribe(user)
    redirect_to user
  end
  
end
