class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  def create
    article = Article.find params[:article_id]
    comment = article.comments.new params[:comment]
    comment.save
    flash[:notice] = 'Comment saved'
    redirect_to article_path(article)
  end
end
