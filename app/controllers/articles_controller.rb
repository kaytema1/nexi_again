class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
  in_place_edit_for :article, :title
  protect_from_forgery :except => [:set_article_title]
  def index
    @articles = Article.all
  end

  def manage
    @articles = Article.paginate :page => params[:page], :per_page => 10, :order => 'created_at ASC'

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
    @page_articles = Article.where(:page_id => params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    @side_page_articles =  Article.where(:page_id => params[:id]).order('RANDOM()').paginate(:page => params[:page], :per_page => 5)

    @article = Article.find(params[:id])
    respond_to do |format|
      format.html { render :action => "edit" }
      format.xml  { render :xml => @article }
    end
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

  def edit_individual
    @articles = Article.find(params[:article_ids])
    @status_options = {'Submitted' => 'Submitted', 'Draft' => 'Draft', 'Published' => 'Published', 'Archived' => 'Archived' }
  end

  def update_individual
    Article.update(params[:articles].keys, params[:articles].values)
    flash[:notice] = "Articles updated"
    redirect_to :action => 'manage'
  end
end
