class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to(:users, :notice => 'Registration successfull.')
      else
        render :action => 'new'
      end
    end

  def update
      if @user.update_attributes(user_params)
        redirect_to(@user, :notice => 'User was successfully updated.')
      else
        render :action => 'edit'
      end
    end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
