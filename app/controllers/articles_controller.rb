class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  respond_to :html

  def index
    @articles = Article.all
    respond_with(@articles)
  end

  def show
    # @comment = @article.comments.build
    # @article.comments.reject(&:new_record?)
    # if user_signed_in?
    #   @comment.user_id = current_user.id
    # end
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
    
    
    
    # Uses Pismo (gem) to grab title, content, photo of URL
    # @article = Article.new_from_url(article_params)
    # @article.save
    # respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:url, :title, :datetime, :content, :photo, :initial_comment)
    end
end
