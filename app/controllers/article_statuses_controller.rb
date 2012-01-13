class ArticleStatusesController < ApplicationController
  def index
    @article_statuses = ArticleStatus.all
  end

  def show
    @article_status = ArticleStatus.find(params[:id])
  end

  def new
    @article_status = ArticleStatus.new
  end

  def create
    @article_status = ArticleStatus.new(params[:article_status])
    if @article_status.save
      redirect_to @article_status, :notice => "Successfully created article status."
    else
      render :action => 'new'
    end
  end

  def edit
    @article_status = ArticleStatus.find(params[:id])
  end

  def update
    @article_status = ArticleStatus.find(params[:id])
    if @article_status.update_attributes(params[:article_status])
      redirect_to @article_status, :notice  => "Successfully updated article status."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article_status = ArticleStatus.find(params[:id])
    @article_status.destroy
    redirect_to article_statuses_url, :notice => "Successfully destroyed article status."
  end
end
