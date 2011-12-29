class ApplicationController < ActionController::Base
  before_filter :pages 
  protect_from_forgery
  
  
  
  def pages
    @pages = Page.all
  end
end
