class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  def index

    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate :page => params[:page], :per_page => 10, :order => 'created_at ASC'
    @page_articles = Article.where(:page_id => params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @side_page_articles =  Article.where(:page_id => params[:id]).order('RANDOM()').paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, :notice => "Successfully created article."
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article, :notice  => "Successfully updated article."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, :notice => "Successfully destroyed article."
  end
end
