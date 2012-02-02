class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find params[:id]
  end
  
  def new
    @user = User.new
  end
  
  def create 
    @user = User.new params[:user]
    if @user.save
      redirect_to admin_user_path(@user), :notice => "User successfully created."
    else
      render :action => :new
    end
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to admin_user_path(@user), :notice => "User successfully updated."
    else
      render :action => :edit
    end
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path, :notice => "User successfully deleted."
  end
end