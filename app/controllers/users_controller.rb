class UsersController < ApplicationController
  before_action :require_user, except: [:new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def new
    if logged_in?
      flash[:alert] = "Access denied."
      redirect_to categories_path
    else
      @user = User.new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was updated successfully."
      redirect_to categories_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Listed. You have successfully signed up!"
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "Account and all associated tasks were succesfully deleted"
    redirect_to root_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end