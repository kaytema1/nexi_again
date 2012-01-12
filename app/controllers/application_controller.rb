class ApplicationController < ActionController::Base
  before_filter :pages, :articles, :jobs, :featured_published_articles, :first_page_articles, :second_page_articles, :third_page_articles
  before_filter :store_location
  def store_location
    session[:user_return_to] = request.url unless params[:controller] == "devise/sessions"
  # If devise model is not User, then replace :user_return_to with :{your devise model}_return_to
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || user_path(current_user)
  end

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
