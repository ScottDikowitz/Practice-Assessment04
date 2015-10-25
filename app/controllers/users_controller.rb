class UsersController < ApplicationController
  def new

  end

  def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        redirect_to links_url
      else
        flash[:error] = @user.errors.full_messages
        redirect_to new_user_url
      end
  end

  def show

  end

  def user_params
    self.params.require(:user).permit(:username, :password)
  end
end
