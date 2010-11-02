class Admin::UsersController < ApplicationController
  
  before_filter :authenticate_user!
  permissions :users
  
  def index
    @users = User.paginate :page => params[:page], :order => "email asc";
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to admin_users_path
    else
      render :action => :new
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end

  def destroy
    num_admins = User.count(:conditions => ['role_name = ?', :admin])
    
    if(num_admins > 1)
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
    end
  end
  
  private
  
  def object
    @user ||= User.find(params[:id])
  end
end
