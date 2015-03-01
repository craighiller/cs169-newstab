class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment successfully created!"
    end
    redirect_to @article
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
  
    def set_article
      @article = Article.find(params[:article_id])
    end
  
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end
end
