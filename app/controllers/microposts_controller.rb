class MicropostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]

  before_filter :authorized_user, :only => :destroy
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to user_path(current_user)
    else
      flash[:warning] = "Content is too long"

      redirect_to user_path(current_user)
    end
  end

  def destroy
    @micropost.destroy
    flash[:warning] = "Micropost Deleted"
    redirect_to user_path(current_user)

  end
  private

  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to user_path(current_user) unless (current_user == @micropost.user)
  end

end
