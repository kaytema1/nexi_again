class UsersController < ApplicationController
  
  
  respond_to :html, :json
  before_filter :admin_user,:only => :destroy
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to root_path
  end

  def index
    @users = User.paginate :page => params[:page], :per_page => 10, :order => 'created_at ASC'
  end

  def show
    @user = User.find(params[:id])
  end
  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
