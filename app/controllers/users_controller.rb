class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil aktualisiert!"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @entries = @user.entries.paginate(:page => params[:page], :per_page => params[:per_page]).order('date DESC')
  end

  def index
    @users = User.all
  end

  def print
    @users = User.find params['selected_users'].split(',')
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:status, :name, :email, :password, :password_confirmation, :balance, :adh, :here, :selected_users) if params[:user]
  end
end
