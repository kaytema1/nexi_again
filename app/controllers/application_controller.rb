class ApplicationController < ActionController::Base
  before_filter :pages, :articles, :jobs, :featured_published_articles, :first_page_articles, :second_page_articles, :third_page_articles

  protect_from_forgery
  layout :layout_by_resource
  def pages
    @pages = Page.all
  end

  def featured_published_articles
    @f_p_articles = Article.where( :status => "featured",  :published => true).order('created_at DESC').limit(6);
  end

  def articles
    @articles = Article.all
  end

  def jobs
    @jobs = Job.all
  end
  
  def first_page_articles
    @first_articles = Article.where(:page_id => 1, :published => true).order('created_at DESC').limit(6)
  end
  
  def second_page_articles
    @second_articles = Article.where(:page_id => 2, :published => true).order('created_at DESC').limit(6)
  end
  
   def third_page_articles
    @third_articles = Article.where(:page_id => 3, :published => true).order('created_at DESC').limit(6)
  end

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

end
