class UsersController < ApplicationController
  
  before_filter :set_user, only: [:show]
  
  def index
    @users = User.all
  end
  
  # We display only a user's posted articles on his/her show page
  def show
    # TODO: Paginate articles?
    @articles = @user.articles
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
  
end