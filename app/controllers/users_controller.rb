class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tests_path
    else
      #Добавляем в сессию идентификатор пользователя после его регистрации
      session[:user_id] = @user.id
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role, :email, :password, :password_confirmation)
  end
end
