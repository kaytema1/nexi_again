class ApplicationController < ActionController::Base
  before_filter :pages, :articles, :jobs
  protect_from_forgery
  def pages
    @pages = Page.all
  end

  def articles
    @articles = Article.all
  end

  def jobs
    @jobs = Job.all
  end
end
