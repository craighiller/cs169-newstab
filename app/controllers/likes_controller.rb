class LikesController < ApplicationController
  before_action :set_article
  before_action :set_like, only: [:destroy]
  before_action :authenticate_user!

  respond_to :html

  def create
    like = Like.new
    current_user.likes << like
    @article.likes << like
    respond_with @article
  end

  def destroy
    @like.destroy
    respond_with @article
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def set_like
      @like = Like.find(params[:id])
    end

    def like_params
      params[:like]
    end
    
end
