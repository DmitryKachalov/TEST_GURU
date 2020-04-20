class UsersController < ApplicationController
  before_action :check_email, only: :create


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      #Добавляем в сессию идентификатор пользователя после его регистрации
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  private

  def check_email

  end

  def user_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end
end
