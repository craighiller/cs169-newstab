class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :verify_own_article, only: [:destroy]
  respond_to :html

  def index
    if user_signed_in?
      @articles = current_user.article_feed
    else
      @articles = Article.all
    end
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    # Creates article object with current_user_id, initial_comment, and URL
    @article = current_user.articles.build(article_params)
    
    # Uses Pismo (gem) to grab title, content, photo of URL
    @article.populate_url_fields
    if @article.save
      flash[:success] = "Article created!"

      # Might need to change the location of this redirect
      redirect_to root_url
    else
      # Let's change this later
      redirect_to root_url
    end
    
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    if @article
      @article.destroy
      flash[:notice] = "Article successfully destroyed."
    else
      flash[:notice] = "You do not have permission to delete this article."
    end
    # TODO: change this to another redirect location
    redirect_to root_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:url, :title, :datetime, :content, :photo, :initial_comment)
    end
    
    # Ensure that a signed in user can only delete articles that they have posted
    def verify_own_article
      @article = current_user.articles.find_by_id(params[:id])
    end
end
