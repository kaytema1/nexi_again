module NexiSessionsHelper
 

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

  def clear_return_to
    session[:return_to] = nil
  end

end
